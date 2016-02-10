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

<img src="https://lh3.googleusercontent.com/xvGmzecgOMb8I4CX4hZ_jy5A_8iv_-yIb8lYZwGD7c-tV4kKFLMBKHisOaTRKiADmslYinYC8P8_QwFWdq7H7r7WDazj1u45KBBxDaMQ5JV3sEIh2XCi9v-taJKrgXDnduxBDzVg1k6aV8JBFqVwCF8WlaVMx_29uguGAuu2-gigUnN86gSIoQS9qzfBhH_RLxmvXBTrSM6jzwoll39delNAdpAXb4mmENohSQxetA6AaqKsgdgUDFZ1wBcSv_U7cuzvi0QDuU-5yH8M0iO-ti-XKS54AfUc0c4BjqIeLqZrVSk9ruzAhkcGPPzm5X-DHf7-Fkwno2O5vg9XKVCObN_mE8q3DbSjXAOvptgrFI8JCPhA6GWgcgmPJlsby6-OYzNlMeISWkZ6dTEkGmgquhO6qxi15NKEW1KzYokj8glJa6al1KqSuZNZgP4L6VVgPWEn4q6foNZAmwGATV9usOvvpmOMg8qw-iLR6RZBO0naLpfzjxASHNCSaAUWqFka9fUlMb9wUdAWA2qwaC3lauEoc81jtELCO47iBjWKnRE4qIrLoobxNg1Tsg5sRBsr_tXz=w1440-h860-no">

The _Layers_ pallette will give you a good idea of what the individual curves do for our bracelet, but basically, the 3D curves are the inner and outer boundary of bracelet. 
The 5 2D profile curves (located at the origin) are what we are going to use to generate our bracelet form.

These **3D inner** and **outer rail curves** and **2D profile curves** are what we are going to link to our Processing sketch to generate printable bracelets.

####Grasshopper
Now open `BodyArchitectures.gh`in Grasshopper. All this Grasshopper script does is convert each rail curve and profile curve into a set of 3D points, the stream those points out as `.txt` files. 
This means that when you modify any of the assigned curves in Rhino, the text file with all the 3D points will also be modified. 

<img src="https://lh3.googleusercontent.com/dM-RVPpeFXwZ1B1aAo6Tb9owv54NEH__-Q3n6OJbS2f3nUyt73X05efXBcs35i_NjhnueRiqmxqjaE8SCJcnmf0uG0ZiVF7Vp5F8addbpPlHctmwl3dgFP0Cbq0CVDLohOQrcLmw_b6JYweukTqHFHpBdP8kx1b5eXjIp-6JINrJdBpWfjCgUnQtitiZur68uH7URmpCVMLZyAp10CO11_NEotHfcLfE1tXI1dQUy7lY5_MXyKTqUpWTWkYcVszWUF8maUO1CwYgllJhB1M71OIsFd1hZjyFBFBraHrmHkCj0vkeWkZsY161S9zfhgkIejeI-Kfp92QqMduczM9nVt_qTupHnXu4E-CvfZCvrTEr5mvMLemFtxUjdYHg9vne5LdoyLUMgZXEwDF90YUwxv3AJHcmUDQF0WM0M-xuY1cX81XO3joEtfbwBLY-zP1QaC8NV-urJ8Ci5yLoILzWE4FUuXDEKupTS5dSzjgvjI6GIfVc-3UHbToiK_nm5TCBNFQdhsi6ZPoCxel5zKZhroD6q2c0MrBCw4JFJC-XFUdX9qynDrpvQyflueAGE_Bv63A2=w1439-h860-no">

By linking these text files to our Processing sketch, we build a pipeline for doing precise 3D modeling in a CAD program while having all the flexibility and extensibility of code-based form.

But before you can use this pipeline, we need configure `BodyArchitectures.gh` for your computer:

* Right-click each of the _Panel_ objects, find `Stream Destination`.

<img src="https://lh3.googleusercontent.com/pwbnapUxTYmEoTbu3ZQbXU5yoKfv74-YBdf252emM4S9h4psP6M5QGVN0jXD6fqwyOo2Jzuqw8zGcu448-K0aKCDoX8CvGl6JdwTS-B1TWLoD7wiqv0xXt0mWoKvuhy-_5irrL-_cY_al5z5Kj2dxFTGVb31oMiyJi2mChCIZFctGa9x3dw05nxrS0SDGhmaFSY3tqf8rwneAPrag5AVuKtvFa3NPwWV45GWRpb3Qz3tRGnK9tzWXAs0Ed2as53sT2yGcgYd6YnY8kd7GHXfsWRRmpb7XERpSs8wwJfhdpvuBzpivbadV0otImcU1n9d-DXo208msnJFzp2tyW-8WCI4kkd_ToYGaofBKYGfr0dem0uli3trNJo2J4bwCtAgL87OSumGClakpaeXkFSpZVjcSLvW09DBccCmLAdpJtbxIWQxeTsOAM5Danhh_o3YJ03Qk7pmj28XqTze9lScIgDpTSI76gm3vrVHT1Rn306R2w3rWuVtseY4cPGAFS6CHcSlmRyZGIoalI0Wcdx8VB7NOl21_E2ERdCFDybFNMAcMVxGxWZRfvb3pY3UWraX3ptn=w2452-h1488-no">

* After selecting `Stream Destination`, navigate to the `\data\geom` folder where you downloaded this project.

<img src="https://lh3.googleusercontent.com/Stl_SYAqc6Wox9h0vdO9m24O1GE3ilnKTmg58AFbJcaXR4wkArvhW8CA0305h1nCQHXNZmst_AisUCV77CcOMUwvBWvIQT_pKYZkWet5yzkVZzSfwZ0UDullTrS8loMPozEPr2aav3PimY0gk6jSxtpcFklpfwjVFk_r1kt4xWa9UrfC9ZYD9EgdfFSwTJDM92T4Sjnxgoqoua__Qkx16ZKB8AlyaiQ9ORAOdKtMi9WlXfmUQGsJH3IqJb7gy0iOx4yUMSIiigjGrUvzcE1acHxA5tkvOpBY_2ZEC3-JIHQFiSgNP30UprHp3CFi3R17vVGoOSsPr5CjXMrQIvbByCQb1F-bQHYAm444-4YiIH9tV4schm6EeRyVq_gsCYrLmNMwKVdtIYmPMSvrseqxfbQBtw75PEISUr9BETVdbvVzHX8yOIog6It972fod3Y4msg-0gwtOdk9oy_MoJo0I2Np3kM6ZNidyUug8pYBCnRulRgnaoC03HebJb7sfsXYMcd8lJbLJsIchjdnnQ08w_tn9KF9fGZaPWjQcNTwJ-4GmPMDWXBnx_eL-2FdQ6qOcjwg=w2452-h1488-no">

* Hit `enter` tooverride the existing file.

####Processing
Open `BodyArchitectures.pde` in Processing 3.0. Before we run our code, you'll need to add the _PeasyCam_ and _Toxiclibs_ libraries to your `Contributed Libraries` folder. 

  * _PeasyCam_ can be installed using Processing 3.0's built-in `Add Library` feature.
  * _Toxiclibs_ needs to be installed manually.
  * Here's how: _[How to Install a Contributed Library](https://github.com/processing/processing/wiki/How-to-Install-a-Contributed-Library)_

With the libraries added, you should be able to run the sketch:

<img src="https://lh3.googleusercontent.com/1kkoAPjcigqI705cSNXB1yafOAWinrcqbbM1EhHKSR0JALTnQ6nJM9vENHjI-Y1GAc6U3g5zGG9dEomG0GCNQ8sWX7dnFR3PDYqCcQVZO5EZGka67U-8XUOghNCcKwOBDK027wjoFj2sMoBlo5xvJdDrwX-pFFbHdUaukW6JGh2WIOPA1EVmu78UqfCzNYCurzFYYcSpf1HHF6fapCv-4Q11eZSHCXAnjpluPZ7EbzCHDQ7ilvXP2BOebQEbscqLVC_bzYfI6mySRaoQ_1mpZrJmHD72BjCZX3QXWkVq2gJnkbiMjXY-JrHgAkRaKcMiiUrhdGULWiW3JJMaLR6DIa2OycKUz6B9k95-2O1habq4T0MtPF0eMc6Hw6pC7716XvAMOqEN-bdGWHlJ8Y2b2Xt1DtAYEPmFGxh9_lpG1L6yauSO7gS0tuOM3xKHV4E__ELhDDk0lv7fjeuSy4wWjfOgK-oz4s2BywtLaTMEqqnCoNcOz6VHCR87FTguN06JEfCRErY5yj9QFIEM4LALa5k2xRT5AU6JJzwYGJ4gzzcrGvagasJUNWaqLds8ZHoR2Nrl=w2114-h1514-no">


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

<img src="https://lh3.googleusercontent.com/AqgRSMc9Vwr60Afv9NNf64PdKBNWtIIg7khsw0QRRTHi0L1BajLK3EGcr826v4XpM8EZwOc8vN6i7z6SK5MNWcQv7V97kNz1GeIT6ooSOFNlO9VepicDrBYqdKHAmAC9SaD3PFd8BBmqUbfVWJvo_7_KJi8JqoAcvqAQH1sqM3MVO6m6pY8lz_fhAPFRtEanvqZZRbuAp--gcex5gxc_29yIZgSqf3kY3htgxdxsN4tdIFUlklq_JdflKAdI319cX7kZpjaGbdZmt8dnUWH0f9J-RINDav5CuTh_ckXOZl2NSh-W-UuGZSjx2qIHzDu2BUfYs6UZRTSTUtvtucvwsKOzXVaMkkzSChxmlrj6JNnn18RoDdsbp_w_8gPbExJtfnP0DEiKlPm0nHw4PS60FmB00Nq4bTjPNaqaEybDXhr18TUQbwbjjV0Ua8EkS3s7gKN62Vssr8VocYj9C9O6JkMhrQSlVVnZ2PBPHHjSdZdPnwB8_juOXFNATVXf9z2ouVzzoZwQuys-cLBpWgztkDQ6xSx4LeepAqWjPOd_80DUuSd1pZhro-ttae3Wehm8Y8Ac=w2452-h1510-no">
<img src="https://lh3.googleusercontent.com/1kkoAPjcigqI705cSNXB1yafOAWinrcqbbM1EhHKSR0JALTnQ6nJM9vENHjI-Y1GAc6U3g5zGG9dEomG0GCNQ8sWX7dnFR3PDYqCcQVZO5EZGka67U-8XUOghNCcKwOBDK027wjoFj2sMoBlo5xvJdDrwX-pFFbHdUaukW6JGh2WIOPA1EVmu78UqfCzNYCurzFYYcSpf1HHF6fapCv-4Q11eZSHCXAnjpluPZ7EbzCHDQ7ilvXP2BOebQEbscqLVC_bzYfI6mySRaoQ_1mpZrJmHD72BjCZX3QXWkVq2gJnkbiMjXY-JrHgAkRaKcMiiUrhdGULWiW3JJMaLR6DIa2OycKUz6B9k95-2O1habq4T0MtPF0eMc6Hw6pC7716XvAMOqEN-bdGWHlJ8Y2b2Xt1DtAYEPmFGxh9_lpG1L6yauSO7gS0tuOM3xKHV4E__ELhDDk0lv7fjeuSy4wWjfOgK-oz4s2BywtLaTMEqqnCoNcOz6VHCR87FTguN06JEfCRErY5yj9QFIEM4LALa5k2xRT5AU6JJzwYGJ4gzzcrGvagasJUNWaqLds8ZHoR2Nrl=w2114-h1514-no" width=420>
<img src="https://lh3.googleusercontent.com/FHUDfqB4VF9wkHw_w14ksuw_ZnzLq-cg-VrFJBVvgVXgDJQGnWDK6IFuOE9MTeF_0UxoAxmALla9ye64CbukDCI1DnuDk1WOr5i-P_m_G_ErVwZuDt88UJCROW-DFa-XLSJ_rAAAZkUwGXHOTbDG9PGOM7reiujGUWpAoEgA-w4Xix6aftn5nzbEkUq6S8rzFBOtUQ3vT3ncT5n9dgNClulahPT_6IwQ6aDaLLtahcVkZDH9906CJs08aPPlCu0QepwrtfCogLF733bK8o94xueLGal7uZghXHvNRgU0FU_I8nQWVynD_xm9fOml6hKVRz4yW_lCAhnwN_v136Rpkxa1C4lUPp7rgcPsuhsyXNzRa4f-7d7wXx51fSnozRQLn39j2dv_X7972FAC7xM4LJBLUKq_60u13z_wdoY8ppRneTlKaq7W6ryxv0nUohBhQiqE9-ByrN2eevNtNWgHiBC2OLg4ZmzAQZWI4plISVo0iYDGNYXcAW6zmHDNxoX5-nT8AB8YdCA_NFCCjwhkjIcSoxsODPMiRPL6nZ6d5r_m56Sxk1U-YMenuzfFCmMWCJYV=w2114-h1514-no" width=420>

You can also change the shape of the outer curves:

1. Turn on the control points for one outer curve.
2. Select and move individual points.

<img src="https://lh3.googleusercontent.com/dS6nTTWGS67nczR2R8nEceZsR6nANldAGx0ufiRQjRh7H6AAqtd_XZDlNRTwRR3lBMycAA45tn8e1rqXyRjE3oPC09dcI0Vp4xLmIO76mRX37MKBUtb0YJd7EDPjoQP_sxvE1B1_BUzdJ8PSSf8eJgOTVm0MaJ1YR89XTZ1U3L9VD-6fwTw34LY_VW28X4Vh4SpM4W4CmZdF7H8wq-cWAAzU8zRncFFY0ILWIzgkPEEyX-zLt1d3hPPNTQMRerPJxbWf47GPMxCtY-UAmyNE39eDlQWgzulmQRBN3cetXLuqJDxEg0JJismQdiHDdAnaRObWLI423-f_iiE5hPv-QT_kTwM8RsBINkruky1pQqV4y0o1A1P-eDl-W59oE3HxQEe3srLyaXB3omLr4AS6pg7JozhFE2GIGjsQiOScrNZjHddCMwLBcMdbWbm_75QtoDhYviocWPyA7KAwgyTJkcyA79P0H6ebv8bPF4TyKPeIio5g5vYZekJDC1uO5pgmGwnYGj6xn8ZjTK648bv04mC0ht19FdNw1UUTSp3c9SGRIScl8OkE6fUyNZiAZr8q2Q7A=w1440-h868-no">
<img src="https://lh3.googleusercontent.com/yWF4ukNpmmuhcpviFtCtiRC1YQ-rYfeaYfGq4CTWZJ9jPnkx6c327Plj43VVAZebhUxp_2bmSIhiNsJybUaZVbz-puz5Xhm0jJIgUYZcctIg9QXJ58NYM5WB2aQ4TjghNdrUaEhFIitL-P1jusPHRTMRgJBv_bgsrVGGZ-HcgD37ZyZwMAyD-csNfs7k-IMFnSw_FlVLG-AkPw8hncAUst_7IW9-tYbuEG9SaQvXbpTCyT5fauojNFtfK7R3hs5TQaK5m3xRihLOgu85uuLV7M7oDAHl7xvn6DzI_dUMuUt6Sm_q8AXSBaiJF_EXCO9gckYWsunIPz1Lx9a58F1KUggjufZlJLDxZi5t5lLn1czYgbO0g5KwvxSfZd6Iqj__s4Jqg8Ap85Yh2uXI-MxwNvJE-9Ip8Nb-yoZ8y99bytfJEA1vXTfx8Ge62JEqoVFn4ws8OtMYaQ8PcPPzUSVicf3j0wn6ZjU0KGD5eAPFkWK50Y79kLVQolsVL9Vhr8tkmRKUpfAW3H3c7Ls99BVWra2meL8veiKmRogH_OgzwrLw1qnb8Vj-BilDMGt6ibviSRz9=w2114-h1514-no">
Lastly, you can also modify the overall design by changing the 2D profile curves:

1. Turn off the `arm mesh` layer in Rhino
2. You should see 5 small closed curves clustered at the origin. Each one of these is what we've been lofting around our interpolated rail curves.
3. Design 5 new **closed** 2D curves and reassign the 5 profile curves streaming from our Grasshopper script. 

With this method, you're getting an entirely new bracelet design with just a few quick modifications in Rhino. Here's an example using ovoid 2D profile curves with one set of inner/outer rail curves rotated:

<img src="https://lh3.googleusercontent.com/lBNEp6q7AAaHemiJjLkbVomn4U66jGOS5kKAcyqtmBDrNZEDCDghVq6T9kL2v7ZqvVeQBZyM6Sh1KLZa90e2RKU6IPul6qAo5NO3tlhaWVqOWqtjwVfK_73qwfsbwadv-SRbla2bwFKfPpcoADjWfK1-oZlHbf-bA-YyJQcHmteEXNJ2KHdZ2wDymD2Qtuwso6A3nRbdmS6UyyjhDy8f5lL_tv3cExICdZH42pe8S3AIiKrEv2olUPIrx-1s4Qq37ZIcapaDIig_vMcPgAP0UbpjbpQV5psLbhMU800ZTLjB04rww07d6LpuwRoSZAIk9S771-EqG8M2QLlgF7WsnRArltkpYXfvaz1q6goSiXuhPuVsvq1M9TTgaWstfOVcNbn54-GopS_fkz8P6UxgcHvyqZUECi82eSmQWenadIlvVqDzrQHkn1XOFoD-1xaFq4C2uErNZ70gUIiVdu8Ik0LbINtdF3KxaZSs4jdaOUVbbK3dwETXFKPLXb7QsbFFOPVAuuaw_4j-9NZkJMTPJBIYf72RIwkDHc71RiHpxnvgoFNs7XhzOasx30Gi2IowI-Iv=w2114-h1514-no">

####For Advanced Users
For those who have some programming experience, here are some places to modify the code so you can customize your bracelet design even more.

#####Dynamically Scale the 2D Profiles
In the existing code, we are scaling the 2D profile curves based on the distance between the `inner` and `outer` curves at a given point. 
But this is fairly static. You could modify the scale factor by *any* sort of input; not just distance.

<img src="https://lh3.googleusercontent.com/LPW0zFwqH-sHUFKWvUBh7YMsN54YX4JvWQkD4uVHqK7cb9FVwPxu0HRjqkZyYUFRSjynCIX9fkVZHwNVlhzGrd2FVGXSEfib6sGDTy3yrrr2JCG0NxOYdH271Vp4aWP3xJF1ebyUlp-ALP-BiAVp_Hbkox0kobCX6635VOepPIk1ulmx6mopdKBE-Cnns4xYA1FK6kyGgzV3uek_NFKLAlhM0-6hhIPRKCUI8ubGUCw_m2zQK6o82TC-4ctHXriOBRTVwQy0Q5fD2maHXTrZNZBuu2qLYdi0LF_331-pXsmIDfiqKdcxTOeNkrGeEeaKGG6W8Gtefm7xcCa064HhDF5ja6NNl0nc0hPoKjQuDP2WnR_xMSIy6c05TkWr8Nrg_q4WX12zef2p23QHt3DeOHo6WBOuohTZvQBZXC-J5RenZLBODCnDG-ZcSTQzMjBmMBcjIItpM0T-sIMWMPH40kXnqcyPAxswiPteuOdUkKi-_NTsKjVMJh8M1syX6JQsrdI2ojgCw8mKvKW9CJ28TpRO2r_XhzVZOTQFFX21WTU9W-lDYQ4bdRxvhbhthJt6FGhp=w1510-h188-no">

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
By starting with geometry from Rhino/Grasshopper, we can precisely model components that need high precision (like the sizing and opening of the bracelet.) It also allows people without much programming experience can get a taste of how linking geometry to Processing can open many more streams of input for crafting 3D form.

Although we couldn't go into great detail about the code included in this tutorial, there are many additional functions you could be useful for future projects:

1. `initCamera()` and `drawAxes()` setup a 3D camera and draws the world axes
2. `drawCrvs()` draws a list of points
2. `mesh()` quad strips two lists of points
3. `interpolateCrvs()` makes any number of linearly interpolated curves between two edge curves

