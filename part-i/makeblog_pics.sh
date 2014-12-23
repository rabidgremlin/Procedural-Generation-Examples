#!/bin/sh

mkdir resized
convert GenerateExamples/anim/*.png -resize 512 resized/res%03d.png
convert resized/*.png -set delay 10 -reverse resized/*.png -set delay 10 -loop 0 -layers optimize animated_tree.gif


montage -mode concatenate -tile 2x GenerateExamples/st_*.png st_tiled.png
montage -mode concatenate -tile 2x GenerateExamples/tree*.png tree_tiled.png
montage -mode concatenate -tile 2x 3dExamples/*.png -resize 512 3d_examples.jpg
