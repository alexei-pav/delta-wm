#!/bin/sh

# set wallpaper
feh --bg-scale <your_image_path>

# set keyboard layout
setxkbmap us,ru -option 'grp:alt_shift_toggle'

# optional (uncomment if nesessary; dwmblocks required)
#dwmblocks &

while true; do
	# log stderr to a file
	dwm 2> ~/.dwm.log
done
