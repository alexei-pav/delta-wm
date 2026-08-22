#!/bin/sh

export DISPLAY=:0
BAT0_PATH=/sys/class/power_supply/BAT0

# set wallpaper (uncomment if needed)
# feh --bg-scale <path/to/your/wallpaper/file>

# set keyboard layout
setxkbmap us,ru -option 'grp:alt_shift_toggle'

deltawm &2> /dev/null
sleep 1

while true; do
	BATT="$(/bin/cat $BAT0_PATH/capacity)%"
	B_STATUS=$(/bin/cat $BAT0_PATH/status)
	case "$B_STATUS" in
        "Charging")
            icon="↑"
            ;;
        "Discharging")
            icon="↓"
            ;;
	"Not charging")
	    icon="$"
	    ;;
        "Full")
            icon="="
            ;;
        *)
            icon="?"
            ;;
	esac
	DATE=$(/bin/date +"%a %b %d %H:%M")

	ROOT="$BATT ${icon} | $DATE"
	xsetroot -name "$ROOT"
	sleep 2 # time between updates
done
