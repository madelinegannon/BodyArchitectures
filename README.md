##Crafting 3D Printed Wearables using Processing
_**Body Architectures Workshop**_


######In this workshop, we will be making some 3D printed bracelets using [Processing](https://www.processing.org) (*...with just a little help from [Rhino](http://www.rhino3d.com/download/) & [Grasshopper](http://www.grasshopper3d.com/page/download-1)*). This workshop is designed for people who are comfortable with more traditional 3D modeling software, but want to learn how they can start using `code` to bring their designs alive.

<img src="https://lh3.googleusercontent.com/gXdfmA_aY0PyoadeRcK7elyKxYLnEFIGtYhbS2Y7k07LnlnY82fAti-Fav4hUI8rmkAuUd7WCZWyxIWQ0PXV1gpTLy66F5yfzswYWTyHeYQmDpza9HaG6z1yr_wVVkgcRcNb1I0yyiYaAPlChLCRIFw4Oge4Whu3oPiLgHzm78wej1bHtwB4dGWmCVeml1hb1u8LLTYaPvd-DqCwFniiC5b1-TwQKguBcABwCbPsnm1OgGbPYMIc4Im8eU27QXb8_uq928gcPKcsctnJosFnx54171ze_XdBGKyyw7c2QnoPl0vsOD_CfNf-KGlYRVP4ZETRzuXKLjAOzzi7C9tLOiw_EgIG8q6KWLiBABz-wm3e0FPNZl81rSEhbxKynQ9MkyG7Mj-kh4ko3viwUzEeSWpJSivb63aS3va3GVwEJxa7k7fw0eZh34LNF1_MMLbo_nPFHlaAfP5tse2BX_AxcAhnIp2jpLxuoBkF0Eo-jrMMF1PpCO0EM3clynAAZp5itrqNVOqm3gkE0knxKVhFQ27ZKN-Zt0NinfjEFgiIxwo0KC5uVc7kRzYvpQ6I4xvQS73R=s640-no" width="400">
<img src="https://lh3.googleusercontent.com/S5TS_1RTyjX6tXE2HXrJheajtK76orhXnovoOLkczQf3TMwmwV-uFvyNuAqAZ9DGdLZ2Z-EiLwIWTQ_7nx1Cl5uL6oPyWPIVQvY2lvF3mgBPFPGJNoscXIsq2NQ5Nh_lvKbvjlvNlp821h64soBdg0t2095Jrc-4aaSccFmpkTVlZbqoQmz8Y-OQ3N3AwKvlp1IcX43TowJLHFFJWlEjlkjhAG0PrRrX9EAO8wAd_3rMXs9AGDuWrUdU8PUujXu4KKVyo_UuLVssNNcMmjJ6ttDHFr6jWp3uysq3GTqF6YTag4UIWSbL-YK3_XzUA3CDdIKTSEd6jvATQAWrxLu-bhnapuiPka6hDHVtO9OffCrTXRWNO3f-f2HViISdjriQosXFqifvq9mQJlw6XWlYOEWytXnI7HthbzV6BXikdfbjQ8DdcK7PfY26jgr2yaoMYyxJFH9OwfZlBztYwjRZ-ECPwyecF__90d0g_1NuSiO1YDGgbRpkmL3hovUmbZcGlfnmaCVmEgcmadY4jqvQrgxRmOzbgwLD71qUsoQ_YWSjYCaD8cRfFiCtbCBhS8BPH8Ko=s720-no" width="400">

Some experience with Processing and 3D modeling is presumed. The code here will be fairly advanced for beginners, but the included example files give you places to mess around with a design to create unique, printable bracelets.

####What You'll Learn
Included in the workshop files are code examples for:
  * Connecting geometry from Rhino/Grasshopper to Processing
  * Setting up a 3D modeling environment in Processing
  * Building valid, 3D printable meshes in Processing
  * Visualizing 3D geometry
  * Exporting .stl's and png's
  

##Getting Started
To get started, lets make sure we are all working with the same software versions. _Just as a note,_ if you are more comfortable with programming than 3D modelling, feel free to skip the Rhino/Grasshopper steps; you can just modify the imported geometry using code.

1. Download [Processing 3.0](https://www.processing.org/download)
  * Install the [PeasyCam](http://mrfeinberg.com/peasycam/peasycam_201.zip) library (for 3D navigation)
  * Install the [Toxiclibs](toxiclibs.org/downloads/) library (for 3D geometry, math, and .stl exporting)
2. Download [Rhinoceros 3D](www.rhino3d.com/download) and its [Grasshopper](http://www.grasshopper3d.com/page/download-1) plug-in. 
  * Mac Users: Grasshopper is now shipped with [Rhino for Mac WIP](http://www.grasshopper3d.com/page/grasshopper-for-mac), but it is not a stable release.
  * Mac & PC Users: Rhino 5.0 for PC has a free 90 day trial, and Grasshopper is a free plug-in
3. Grab the files from this repo.

##Configuring Files
####Rhino

Open up `BodyArchitectures.3dm`. You should see a 3D scan of an arm with some 3D curves modelled around it. 

<img src="https://c2.staticflickr.com/2/1623/24306194624_0e20b3cde2_b.jpg">

The _Layers_ pallette will give you a good idea of what the individual curves do for our bracelet, but basically, the 3D curves are the inner and outer boundary of bracelet. 
The 5 2D profile curves (located at the origin) are what we are going to use to generate our bracelet form.

These **3D inner** and **outer rail curves** and **2D profile curves** are what we are going to link to our Processing sketch to generate printable bracelets.

####Grasshopper
Now open `BodyArchitectures.gh`in Grasshopper. All this Grasshopper script does is convert each rail curve and profile curve into a set of 3D points, the stream those points out as `.txt` files. 
This means that when you modify any of the assigned curves in Rhino, the text file with all the 3D points will also be modified. 

<img src="https://c2.staticflickr.com/2/1616/24306194684_7ff3069127_b.jpg">

By linking these text files to our Processing sketch, we build a pipeline for doing precise 3D modeling in a CAD program while having all the flexibility and extensibility of code-based form.

But before you can use this pipeline, we need configure `BodyArchitectures.gh` for your computer:

* Right-click each of the _Panel_ objects, find `Stream Destination`.

<img src="https://c2.staticflickr.com/2/1441/24306194604_196db9262c_b.jpg">

* After selecting `Stream Destination`, navigate to the `\data\geom` folder where you downloaded this project.

<img src="https://c2.staticflickr.com/2/1444/24936783105_1f2919fb17_b.jpg">

* Hit `enter` to override the existing file.

####Processing
Open `BodyArchitectures.pde` in Processing 3.0. Before we run our code, you'll need to add the _PeasyCam_ and _Toxiclibs_ libraries to your `Contributed Libraries` folder. 

  * _PeasyCam_ can be installed using Processing 3.0's built-in `Add Library` feature.
  * _Toxiclibs_ needs to be installed manually.
  * Here's how: _[How to Install a Contributed Library](https://github.com/processing/processing/wiki/How-to-Install-a-Contributed-Library)_

With the libraries added, you should be able to run the sketch:

<img src="https://c2.staticflickr.com/2/1551/24936783035_c3e8e3f07b_z.jpg">


##Code Structure
Let me just briefly go over what some of the more important functions in `BodyArchitectures.pde` are doing:

1.  _loadGHdata()_ 
  * Loads the text file points from the `\data\geom` folder
  * Converts the points from `string` to `Vec3D`
  * Stores the 3D points to build our 3D geometry
2. _createEnvelopeCrvs()_
  * Interpolates the curves brought in through `loadGHdata()` into 5 inner and outer curves. 
  * These 5 curves will guide how our `profileCrvs` will be lofted into a 3D mesh.
3. _buildMesh()_
  * Reorients and translates each 2D `profileCrv` to align with a point on its corresponding `inner` curve
  * Scales the height of the reorineted profile curve to match the distance between the `inner` and `outer` curve
  * Builds a mesh from the list of reoriented profile curves
  
There are also some `keyPressed` controls for you to use:

1. 'S' = save STL
2. 'B' = rebuild geometry
3. 'M' = show mesh
4. 'W' = show wireframe

##Modifying the Bracelet Design
There are a few different ways you can modify these example files to make them your own.

####For Beginners
Now that we have our Rhino file linked to our Processing sketch via Grasshopper, any manual changes we make to geometry in Rhino will also show up in Processing. Try this:

1. In Rhino, grab one set of inner/outer curves and move them in the +X direction.
2. In Processing, press 'B' to rebuild the mesh.

You should see that your bracelet is far wider than previously. _If not, make sure that your .txt files in grasshopper are pointing to the_ `\data\geom` _folder and are streaming properly_:

<img src="https://c2.staticflickr.com/2/1710/24936783015_2404492d59_b.jpg">
<img src="https://c2.staticflickr.com/2/1551/24936783035_c3e8e3f07b_n.jpg">
<img src="https://c2.staticflickr.com/2/1593/24641306760_ba4fb01482_n.jpg">

You can also change the shape of the outer curves:

1. Turn on the control points for one outer curve.
2. Select and move individual points.

<img src="https://c2.staticflickr.com/2/1695/24309942803_d122ca7a30_b.jpg">
<img src="https://c2.staticflickr.com/2/1551/24569161089_8b9deea317_z.jpg">

Lastly, you can also modify the overall design by changing the 2D profile curves:

1. Turn off the `arm mesh` layer in Rhino
2. You should see 5 small closed curves clustered at the origin. Each one of these is what we've been lofting around our interpolated rail curves.
3. Design 5 new **closed** 2D curves and reassign the 5 profile curves streaming from our Grasshopper script. 

With this method, you're getting an entirely new bracelet design with just a few quick modifications in Rhino. Here's an example using ovoid 2D profile curves with one set of inner/outer rail curves rotated:

<img src="https://c2.staticflickr.com/2/1710/24936782915_1300f43306_z.jpg">

####For Advanced Users
For those who have some programming experience, here are some places to modify the code so you can customize your bracelet design even more.

#####Dynamically Scale the 2D Profiles
In the existing code, we are scaling the 2D profile curves based on the distance between the `inner` and `outer` curves at a given point. 
But this is fairly static. You could modify the scale factor by *any* sort of input; not just distance.

<img src="https://c2.staticflickr.com/2/1499/24569160889_2460f3bf64_z.jpg">

Scaling happens in `alignProfiles()`. Here are some other ideas for tweaking the scalar value:

1. Add random noise or jitter to make the profiles more jagged.
2. Use a mathematical function, like `sine` or `cosine`, to add a cyclical undulation the scalar.
3. Integrate live data, like from sound, webcams, or even [twitter](http://twitter4j.org/en/), to visualize a data set as 3D form.

#####Integrate Faster Feedback
Currently our example reads and writes to text files to connect Processing to Rhino via Grasshopper. Although this is effective, it means we need to manually reload our data every time we update Rhino. But there is a much faster communication technique ... [OSC](https://en.wikipedia.org/wiki/Open_Sound_Control)!

Fortunately, both Processing and Grasshopper have ways to integrate OSC:

1. In Processing, use the [oscP5](http://www.sojamo.de/libraries/oscp5) library.
2. In Grasshopper, use the [gHowl](http://www.grasshopper3d.com/group/ghowl) plug-in.
3. Modify `loadPts` to read incoming OSC messages, instead of text files.
3. Add the `rebuild()` function into `oscEvent()` handler.

With this you'll see that any changes made in Rhino immediately update your Processing sketch.

#####Use Meshes Instead of 2D Profiles
The alignment method `sweep()` is currently uses 2D profiles to loft 3D geometry, but it also works used fully 3D meshes! For example, this bracelet design reorients 5 closed-solid meshes on the rail curves (instead of 5 2D profile curves). A rail is added on the edges to make sure everything connects:

<img src="https://lh3.googleusercontent.com/S5TS_1RTyjX6tXE2HXrJheajtK76orhXnovoOLkczQf3TMwmwV-uFvyNuAqAZ9DGdLZ2Z-EiLwIWTQ_7nx1Cl5uL6oPyWPIVQvY2lvF3mgBPFPGJNoscXIsq2NQ5Nh_lvKbvjlvNlp821h64soBdg0t2095Jrc-4aaSccFmpkTVlZbqoQmz8Y-OQ3N3AwKvlp1IcX43TowJLHFFJWlEjlkjhAG0PrRrX9EAO8wAd_3rMXs9AGDuWrUdU8PUujXu4KKVyo_UuLVssNNcMmjJ6ttDHFr6jWp3uysq3GTqF6YTag4UIWSbL-YK3_XzUA3CDdIKTSEd6jvATQAWrxLu-bhnapuiPka6hDHVtO9OffCrTXRWNO3f-f2HViISdjriQosXFqifvq9mQJlw6XWlYOEWytXnI7HthbzV6BXikdfbjQ8DdcK7PfY26jgr2yaoMYyxJFH9OwfZlBztYwjRZ-ECPwyecF__90d0g_1NuSiO1YDGgbRpkmL3hovUmbZcGlfnmaCVmEgcmadY4jqvQrgxRmOzbgwLD71qUsoQ_YWSjYCaD8cRfFiCtbCBhS8BPH8Ko=s720-no">

To use meshes instead of profile curves, you'll need to modify how geometry from Rhino/Grasshopper is imported:

1. 3D Model and save 5 mesh modules in the `\data\geom` folder.
2. You can import the meshes using an `STLReader` in [toxiclibs](http://toxiclibs.org/docs/core/toxi/geom/mesh/STLReader.html). Save them to a list of type `TriangleMesh`
3. In `alignProfiles()`, copy and apply the reorientation matrix directly to the original mesh module
4. Be sure to add all the new meshes to the `models` list.

##Saving & Printing 3D Models
When you've got a bracelt design that you like, you and press 'S' to save out the model. When saved, the 3D model (.stl) and screenshot (.png) are saved to the `\data\prints` folder.

1. You can change the name of your files saving out in the `saveModels()` function.

#####3D Printing
Although the bracelet geometry is challenging for desktop FDM printers (there are lots of overhangs that require support structures), I've had fairly good success printing variations on Ultimakers and Makerbots. However you'll need to do a little bit of _post-processing_ to increase your chances of a successful print:

1. Download [Meshmixer](http://www.meshmixer.com/download.html)
2. Import your saved out .stl and [add supports](http://www.instructables.com/id/Meshmixer-Generate-Supports/)
3. Save the .stl with supports as a brand new file
4. Use this new file for whatever slicer you're using (e.g., Makerbot Desktop or Cura)
5. Make sure you print with a raft, there's no need to generate additional supports
 
The Meshmixer supports use a branching structure that are quite minimal. This significantly reduces printing and clean up time!

##  

##Summary
I hope this has given you a good starting point for exploring 3D modeling and printing in Processing. 
By starting with geometry from Rhino/Grasshopper, we can precisely model components that need high precision (_like the sizing or the opening of a bracelet_). It also allows people without much programming experience can get a taste of how linking geometry to Processing can open many more streams of input for crafting 3D form.

Although we couldn't go into great detail about the code included in this tutorial, there are many additional functions you could be useful for future projects:

1. `initCamera()` and `drawAxes()` setup a 3D camera and draws the world axes
2. `drawCrvs()` draws a list of points
2. `mesh()` quad strips two lists of points
3. `interpolateCrvs()` makes any number of linearly interpolated curves between two edge curves

