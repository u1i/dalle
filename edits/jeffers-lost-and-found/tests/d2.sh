#!/bin/bash
mkdir -p blended
for x in {0..50}
do
    blend=$((x*x/25))
    xx="00${x}"
    xx="${xx: -2}"
    composite B.png t-$x.png -blend $blend blended/b-$xx.png
done

exit

cd blended
ffmpeg -framerate 12 -pattern_type glob -i '*.png' -c:v libx264 -profile:v baseline -pix_fmt yuv420p B.mp4
ffmpeg -loop 1 -i b-00.png -t 3 -c:v libx264 -profile:v baseline -pix_fmt yuv420p A.mp4
ffmpeg -loop 1 -i b-50.png -t 5 -c:v libx264 -profile:v baseline -pix_fmt yuv420p C.mp4
ffmpeg -f concat -safe 0 -i <(for f in ./*.mp4; do echo "file '$PWD/$f'"; done) -c copy D.mp4

