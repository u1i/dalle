inp=2.png

cp $inp out0.png
for x in {1..10}
do
	# convert out$((x-1)).png -geometry 110% out$x.png
	nw=$(identify -format "%w" out$x.png)
	si=$(( (nw-1024) / 2 ))
	#convert out$x.png -crop 1024x1024+${si}+${si} -geometry 1024x1024 x$x.jpg

done

for x in {2..10}
do
	echo $x
	#### convert x$x.jpg x$((x-1)).jpg -delay 10 -morph 10 $x.gif

	# convert x$x.jpg x$((x-1)).jpg -delay 10 -morph 10 $x.jpg

	# convert -delay 6 -quality 95 ${x}*.jpg ${x}.mp4
done

#convert 10.gif 9.gif 8.gif 7.gif 6.gif 5.gif 4.gif 3.gif 2.gif o.gif
convert 10.mp4 9.mp4 8.mp4 7.mp4 6.mp4 5.mp4 4.mp4 3.mp4 2.mp4 o.mp4

#ffmpeg -f gif -i o.gif o.mp4


