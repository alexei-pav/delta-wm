#!/bin/sh

export DISPLAY=:0

# set wallpaper (uncomment if needed)
# feh --bg-scale <your_image_path>

# set keyboard layout
setxkbmap us,ru -option 'grp:alt_shift_toggle'

deltawm 2> /dev/null

# update data (change sleep time if needed)
while true; do
	BATT="$(/bin/cat /sys/class/power_supply/BAT0/capacity)%"
	DATE=$(/bin/date +"%a %b %d %H:%M")

	ROOT="$BATT | $DATE"
	xsetroot -name "$ROOT"
	sleep 2
done
