import peasy.*;

import toxi.geom.*;
import toxi.geom.mesh.*;
import toxi.math.*;
import toxi.util.*;

import toxi.processing.*;


/**
 * 3D Printed Wearables using Processing
 *
 * Body Architectures Symposium 
 * FIU MBUS 
 *
 * Workshop Instructions: 
 *     https://hackpad.com/Body-Architectures-Workshop-lomrgOayNQR
 *
 * Keypressed Commands:
 *    'S' : save STL
 *    'B' : rebuild geometry
 *    'M' : show mesh
 *    'W' : show wireframe
 * 
 * Madeline Gannon | madlab.cc | @madelinegannon
 * 02.06.2016
 */



// variables for our GUI 
private PeasyCam cam;
private int bounds = 800;
private boolean showWireframe = true;
private boolean showMesh = true;
private boolean saveModel = false;

// variables for our Rhino/GH input
private ArrayList<ArrayList<Vec3D>> innerCrvs, outerCrvs, railCrvs, profileCrvs;

// variables for our Meshes 
private ToxiclibsSupport gfx;
private ArrayList<TriangleMesh> models = new ArrayList<TriangleMesh>();
// keeping track of our 3D profiles
ArrayList<ArrayList<ArrayList<Vec3D>>> profiles = new ArrayList<ArrayList<ArrayList<Vec3D>>>();

public void setup() {
  size(1080, 720, PConstants.OPENGL);

  // set up the 3D world & camera
  initCamera();
  gfx = new ToxiclibsSupport(this);

  // bring in the base geometry we created in Rhino/GH 
  loadGHdata();
  createEnvelopeCrvs();
  buildMesh();
}

public void draw() {
  // draw the background
  background(120);
  int brightness = 180;
  ambientLight(brightness/3, brightness/3, brightness/3, 0, -1, 0);
  directionalLight(brightness, brightness, brightness, 0, -1, 0);  
  drawAxes();

  // make what we draw a little bigger for easier navigation
  pushMatrix();
  float scalar = 5f;
  scale(scalar);

  // show our Rhino/GH geometry if we're pressing the left mouse button
  if (mousePressed && (mouseButton == LEFT)) {
    pushStyle();
    strokeWeight(5/scalar);
    stroke(200, 10, 200, 40);
    noFill();

    // draw the outer envelope
    drawCrvs(railCrvs); 
    // draw the inner envelope
    strokeWeight(2/scalar);
    drawCrvs(innerCrvs);
    drawCrvs(outerCrvs);

    popStyle();
  }

  strokeWeight(1/scalar);
  if (showMesh)
    showMesh();

  if (showWireframe)
    showWireframe();

  popMatrix();

  // save out the geometry as a printable .STL
  if (saveModel) {
    saveModel(models);
    saveModel = false;
  }
}


public void keyPressed() {

  if (key == 'w' || key == 'W')
    showWireframe = !showWireframe;

  if (key == 'm' || key == 'M')
    showMesh = !showMesh;

  if (key == 's' || key == 'S')
    saveModel = true;

  // re- import & build the geometry
  if (key == 'b' || key == 'B') {
    models.clear();
    profiles.clear();

    loadGHdata();
    createEnvelopeCrvs();
    buildMesh();
  }
}

////////////////////////////////////////////////
////////////// SAVING GEOMETRY /////////////////
////////////////////////////////////////////////

private void saveModel(ArrayList<TriangleMesh> modelList) {
  String myName = "MAD"; // <-- PUT YOUR NAME HERE
  String path = dataPath("")+"/prints/";

  String filename = this.getClass().getSimpleName()+"_"+myName+"_";
  filename += getFileCountSuffix(path, filename);

  TriangleMesh finalOutput = new TriangleMesh();
  for (TriangleMesh mesh : models)
    finalOutput.addMesh(mesh);

  finalOutput.saveAsSTL(path+filename+".stl");

  // save out a screenshot with the .STL
  saveFrame(path+filename + ".png");
}

private static String getFileCountSuffix(String path, String prefix) {

  File [] fileList=new File(path).listFiles();
  int index=-1;
  for (File f : fileList) if (f.isFile() ) {
    String name=f.getName().toLowerCase().trim();

    if (name.startsWith(prefix.toLowerCase()) && 
      (name.endsWith("png") || name.endsWith("stl"))
      ) {

      name=name.substring(prefix.length());

      int pos=name.indexOf('.');
      if (pos>-1) 
        name=name.substring(0, pos);

      int id=parseInt(name);
      if (id>Integer.MIN_VALUE) 
        index=max(index, id);
    }
  }

  return ""+nf(index+1, 3);
}

////////////////////////////////////////////////

////////////////////////////////////////////////
//////////// BUILDING GEOMETRY /////////////////
////////////////////////////////////////////////

/**
 * Regenerates our bracelet by sweeping a profile curve
 * between an inner and outer boundary curve.
 */
private void buildMesh() {

  for (int i=0; i<innerCrvs.size(); i++) {
    models.add(sweep(innerCrvs.get(i), outerCrvs.get(i), profileCrvs.get(i)));

    // cap the model end caps
    // get the first profile
    ArrayList<Vec3D> first = profiles.get(i).get(0);
    ArrayList<Vec3D> last  = profiles.get(i).get(profiles.get(i).size()-1);
    models.add(capEnds(first, false));
    models.add(capEnds(last, true));
  }
}


/**
 * Sweeps a profile curve between an inner and outer boundary curve.
 */
private TriangleMesh sweep(ArrayList<Vec3D> inner, ArrayList<Vec3D> outer, ArrayList<Vec3D> profile) {
  TriangleMesh model = new TriangleMesh();

  ArrayList<ArrayList<Vec3D>> profiles3D = alignProfiles(inner, outer, profile);

  // build the mesh from the list of 3D profiles
  for (int i=0; i<profiles3D.size()-1; i++) {
    model.addMesh(mesh(profiles3D.get(i), profiles3D.get(i+1)));
  }

  profiles.add(profiles3D);

  return model;
}

private TriangleMesh mesh(ArrayList<Vec3D> crv0, ArrayList<Vec3D> crv1) {
  TriangleMesh model = new TriangleMesh();

  for (int i=0; i<crv0.size(); i++) {

    Vec3D a, b, c, d;

    // connect first to last points
    if (i == crv0.size()-1) {
      a = crv0.get(i);
      b = crv1.get(i);
      c = crv1.get(0);
      d = crv0.get(0);
    } 

    // connect middle points
    else {
      a = crv0.get(i);
      b = crv1.get(i);
      c = crv1.get(i+1);
      d = crv0.get(i+1);
    }

    model.addFace(c, b, a);
    model.addFace(d, c, a);
  }

  return model;
}

/**
 * Closes the ends of a mesh by connecting the edge of a profile
 * to the profile's centroid.
 *
 * @param ptList – 3D profile curve
 * @param flip – direction to orient the mesh face
 */
private TriangleMesh capEnds(ArrayList<Vec3D> ptList, boolean flip) {
  TriangleMesh temp = new TriangleMesh();

  // get the centroid
  Vec3D centroid = new Vec3D();
  for (Vec3D pt : ptList)
    centroid.addSelf(pt);
  centroid.scaleSelf(1f/ptList.size());

  // connect the edges to the centroid
  Vec3D a, b;
  int count = 0;
  if (flip) {
    for (int i=0; i<ptList.size(); i++) {
      a = ptList.get(i);
      if (i == ptList.size()-1)
        b = ptList.get(0);
      else
        b = ptList.get(i+1);

      temp.addFace(a, b, centroid);
    }
  } else {
    for (int i=ptList.size()-1; i>=0; i--) {
      a = ptList.get(i);
      if (i == 0)
        b = ptList.get(ptList.size()-1);
      else
        b = ptList.get(i-1);


      temp.addFace(a, b, centroid);
    }
  }

  return temp;
}

/**
 * Aligns a 2D profile to a list of 3D positions/orientations.
 * @return list of aligned 3D profiles
 */
private ArrayList<ArrayList<Vec3D>> alignProfiles(ArrayList<Vec3D> inner, ArrayList<Vec3D> outer, ArrayList<Vec3D> profile) {
  ArrayList<ArrayList<Vec3D>> profileLists = new ArrayList<ArrayList<Vec3D>>();

  // Create a list of orientation quaternions
  ArrayList<Quaternion> orientations = generateOrientations(inner);

  // Scale and Align meshes
  float minDist = 2;
  float maxDist = 12.7f;
  for (int i=0; i<inner.size(); i++) {  

    Quaternion alignment=orientations.get(i);

    float scalar = map(inner.get(i).distanceTo(outer.get(i)), minDist, maxDist, 1, 4);

    // construct a matrix to move shape to current curve position
    Vec3D v0, v1;
    if (i<inner.size()-1) {
      v0= inner.get(i);
      v1 = inner.get(i+1);
    } else {
      v0= inner.get(i-1);
      v1 = inner.get(i);
    }
    Matrix4x4 mat=new Matrix4x4().translateSelf(i<inner.size()-1 ? v0 : v1);

    // create reorientation matrix
    mat.multiplySelf(alignment.toMatrix4x4());


    // duplicate and reorient profile curve
    profileLists.add(new ArrayList<Vec3D>());

    if (i<inner.size()/2) {
      for (Vec3D p : profile) {
        Vec3D pt = p.copy().scaleSelf(scalar);
        pt = mat.applyToSelf(pt);
        profileLists.get(profileLists.size()-1).add(pt);
      }
    } else {

      for (Vec3D p : profile) {
        Vec3D pt = p.copy().scaleSelf(scalar);

        pt.y *=-1;          

        pt = mat.applyToSelf(pt);
        profileLists.get(profileLists.size()-1).add(pt);
      }
    }
  }


  return profileLists;
}

/**
 * Generates a list of orientation quaternions for aligning meshes or profiles.<br/>
 * Conditions:
 * <ul>
 * - inner must be symmetrical        <br/>
 * - 1/2 of meshes/profiles must be mirrored  <br/>
 * </ul>
 * 
 * @param inner
 * @return
 */
private ArrayList<Quaternion> generateOrientations(ArrayList<Vec3D> crv) {

  // Create & store first 1/2 of orientation quaternions
  ArrayList<Quaternion> orientations = new ArrayList<Quaternion> ();  
  for (int i=0; i<crv.size()/2; i++) {
    Vec3D v0 = crv.get(i);
    Vec3D v1 =  crv.get(i+1);

    // compute current curve direction
    orientations.add(Quaternion.getAlignmentQuat(v1.sub(v0).normalize(), Vec3D.Z_AXIS));
  }


  // Copy & invert for the 1/2 half of orientations
  ArrayList<Quaternion> inverse = new ArrayList<Quaternion> ();
  for (int i=crv.size()/2; i<crv.size(); i++) {

    int index = crv.size()-i - 1;  

    Quaternion q = orientations.get(index);
    q = q.getConjugate();
    inverse.add(q);
  }

  orientations.addAll(inverse);

  return orientations;
}

////////////////////////////////////////////////


////////////////////////////////////////////////
//////////// VISUALIZING GEOMETRY //////////////
////////////////////////////////////////////////

private void drawCrvs(ArrayList<ArrayList<Vec3D>> crvs) {

  // if our geometry has already been loaded
  if (crvs != null) {

    for (ArrayList<Vec3D> ptList : crvs) {
      beginShape();
      for (Vec3D pt : ptList)
        vertex(pt.x, pt.y, pt.z);
      endShape();
    }
  }
}

private void showWireframe() {
  pushStyle();

  stroke(200, 140);
  noFill();
  for (ArrayList<ArrayList<Vec3D>> ptLists : profiles) {

    for (ArrayList<Vec3D> ptList : ptLists) {
      beginShape();
      for (Vec3D pt : ptList)
        vertex(pt.x, pt.y, pt.z);
      endShape(CLOSE);
    }
  }

  popStyle();
}

private void showMesh() {
  pushStyle();

  fill(8, 109, 220, 200);
  stroke(11, 155, 220, 50);
  for (TriangleMesh m : models)
    gfx.mesh(m);

  popStyle();
}

////////////////////////////////////////////////


////////////////////////////////////////////////
///////////// IMPORTING GEOMETRY ///////////////
////////////////////////////////////////////////

/**
 * Brings in the 3D base geometry we've created
 * in Rhino/Grasshopper.
 */
private void loadGHdata() {

  // load the inner/outer boundary curves
  railCrvs = new ArrayList<ArrayList<Vec3D>>();
  innerCrvs = new ArrayList<ArrayList<Vec3D>>();
  outerCrvs = new ArrayList<ArrayList<Vec3D>>();
  profileCrvs = new ArrayList<ArrayList<Vec3D>>();


  for (int i=0; i<2; i++) {
    railCrvs.add(loadPts("innerRailCrv_"+i+".txt"));
    railCrvs.add(loadPts("outerRailCrv_"+i+".txt"));
  }

  // load profile curves
  for (int i=0; i<5; i++)
    profileCrvs.add(loadPts("profileCrv_"+i+".txt"));
}


/**
 * Generates the inner and outer boundary curves of the bracelet.
 */
private void createEnvelopeCrvs() {

  innerCrvs = interpolateCrvs(railCrvs.get(0), railCrvs.get(2), profileCrvs.size());  
  outerCrvs = interpolateCrvs(railCrvs.get(1), railCrvs.get(3), profileCrvs.size());
}


/**
 * Interpolates between two curves.
 * 
 * @param crv_0 - first curve
 * @param crv_1 - last curve
 * @param count - number of in-between curves to generate
 * @return
 */
private ArrayList<ArrayList<Vec3D>> interpolateCrvs(ArrayList<Vec3D> crv_0, ArrayList<Vec3D> crv_1, int count) {

  ArrayList<ArrayList<Vec3D>> temp = new ArrayList<ArrayList<Vec3D>>();

  for (int i=0; i<count; i++)
    temp.add(new ArrayList<Vec3D>());

  // add first and last curves
  temp.set(0, crv_0);
  temp.set(count-1, crv_1);

  // build interior curves
  for (int j=1; j<count-1; j++) {
    for (int i=0; i<crv_0.size(); i++) {

      Vec3D v0=crv_0.get(i);
      Vec3D v1=crv_1.get(i);

      Vec3D v=v0.interpolateTo(v1, j/(count-1.0f));

      if (temp.get(j).size() < crv_0.size()) 
        temp.get(j).add(v);
      else 
      temp.get(j).set(i, v);
    }
  }

  return temp;
}

/**
 * Converts a txt file of string points into a list of 3D points.
 *   
 * @param filename
 * @return
 */
private ArrayList<Vec3D> loadPts(String filename) {
  String path = dataPath("") + "/geom/";
  BufferedReader reader = createReader(path+filename);
  ArrayList<String> stringPts = new ArrayList<String>();

  // read in points from calibration file
  boolean reading = true;
  while (reading) {
    String pt = null;
    try {
      pt = reader.readLine();
    } 
    catch (IOException e) {
      e.printStackTrace();
    }

    if (pt != null) {
      stringPts.add(pt);
    } else
      reading = false;
  }

  // reformat stringPts into 3D pt
  ArrayList<Vec3D> ptList = new ArrayList<Vec3D>();

  println(stringPts.size()+" Points Loaded from "+filename+":");
  for (String s : stringPts) {

    // fix point formatting (remove { , , })
    String[] coords = s.substring(1, s.length()-1).split(", ");

    // incoming string format: "{x, y, z}"
    String[] xyz = s.substring(1, s.length()-1).split(", ");      
    Vec3D pt = new Vec3D(Float.valueOf(xyz[0]), Float.valueOf(xyz[1]), Float.valueOf(xyz[2]));

    ptList.add(pt);        
    println("  "+pt);
  }
  println();
  return ptList;
}

////////////////////////////////////////////////


////////////////////////////////////////////////
///////////// SETTING UP OUR GUI ///////////////
////////////////////////////////////////////////

private void drawAxes() {
  pushStyle();

  int alpha = 40;

  strokeWeight(5);    
  stroke(102, 215, 255, alpha);  // +Z = blue
  line(0, 0, 0, 0, 0, bounds);
  stroke(141, 232, 141, alpha);  // +Y = green
  line(0, 0, 0, 0, bounds, 0);
  stroke(255, 95, 80, alpha);    // +X = red
  line(0, 0, 0, bounds, 0, 0);

  strokeWeight(3);
  stroke(102, 215, 255, alpha/2);    // -Z = blue
  line(0, 0, 0, 0, 0, -bounds);
  stroke(141, 232, 141, alpha/2);    // -Y = green
  line(0, 0, 0, 0, -bounds, 0);
  stroke(255, 95, 80, alpha/2);    // -X = red
  line(0, 0, 0, -bounds, 0, 0);

  popStyle();
}

/** 
 * Sets up camera positions and system colors for mode changes
 */
private void initCamera() {

  cam = new PeasyCam(this, bounds/4);

  cam.setCenterDragHandler(cam.getPanDragHandler());
  cam.setRightDragHandler(cam.getRotateDragHandler());
  cam.setWheelHandler(cam.getZoomWheelHandler());
  cam.setWheelScale(.25f);
  cam.setLeftDragHandler(null);
  cam.setMinimumDistance(0);
  cam.setMaximumDistance(bounds*20);

  cam.rotateX(radians(-90));
  cam.rotateY(radians(30));
  cam.rotateX(radians(25));
}

////////////////////////////////////////////////