#!/bin/sh

# set wallpaper (uncomment if needed)
# feh --bg-scale <your_image_path>

# set keyboard layout
setxkbmap us,ru -option 'grp:alt_shift_toggle'

while true; do
	# log stderr to a file
	deltawm 2> ~/.deltawm.log
done
