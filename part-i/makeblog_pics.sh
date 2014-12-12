#!/bin/sh

convert GenerateExamples/anim/*.png -set delay 10 -reverse GenerateExamples/anim/*.png -set delay 10 -loop 0 -layers optimize animated_tree.gif

montage -mode concatenate -tile 2x GenerateExamples/st_*.png st_tiled.png
montage -mode concatenate -tile 2x GenerateExamples/tree*.png tree_tiled.png