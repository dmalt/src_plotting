# Tools to plot source-level colormaps and atlases in MATLAB.

## Installation

Copy the files to your local machine and run from the same folder

## Usage

Functions in this package work with brainstorm-generated brain surfaces.
One can either export those surfaces from brainstorm to a MATLAB variable
or save them for later usage.

High resolution surfaces must have at least ~1e5 vertices for smooth data plotting.
Otherwise the  pictures will be "edgy"

Brainstorm supports exporting of inflated brain surfaces. To export inflated brain from 
brainstorm do the following:

1. Launch brainstorm. Open your protocol
2. Go to anatomies tab. Double click on high resolution surface you want to get inflated 
   brain for.
3. A window with 3-d plot of the surface will pop up. Tweak the smoothing slider on the 
   right hand side of the main brainstorm window to get a desired level of smoothing. 
   You will see changes on the window with 3-d image.
4. Right click at somewhere on window with 3-d image. From popped up menu select 
   "Snapshot --> "