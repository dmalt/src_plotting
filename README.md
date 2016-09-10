# Tools to plot source-level colormaps and atlases in MATLAB.

## Installation

Copy the files to your local machine and run from the same folder

## Workflow

Functions in this package work with brainstorm-generated brain surfaces.
One can either export those surfaces from brainstorm to a MATLAB variable
or use .mat files with previously saved surfaces.



High resolution surfaces must have at least ~1e5 vertices for smooth data plotting.
Otherwise the  pictures will be "edgy"

Brainstorm supports exporting of inflated brain surfaces. To export inflated brain from 
brainstorm do the following:

1. Launch brainstorm. Open your protocol
2. Go to anatomies tab. Double click on high resolution surface you want to get inflated 
   brain for.
   ![alt tag](https://cloud.githubusercontent.com/assets/8067672/18413735/d5eda38c-777f-11e6-96e7-7ae92ae070cb.png)

3. A window with 3-d plot of the surface will pop up. Tweak the smoothing slider on the 
   right hand side of the main brainstorm window to get a desired level of smoothing. 
   You will see changes on the window with 3-d image.
   ![alt tag](https://cloud.githubusercontent.com/assets/8067672/18413756/9e071f4c-7780-11e6-8e6f-62c43c1f62ba.png)

4. Right click at somewhere on window with 3-d image. From popped up menu select 
   "Snapshot --> Save surface: Cortex"
   A new surface will appear in your brainstorm protocol
   ![alt tag](https://cloud.githubusercontent.com/assets/8067672/18413765/144793b2-7781-11e6-9ef0-476497f842a4.png)
