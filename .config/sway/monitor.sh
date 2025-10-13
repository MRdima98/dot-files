export name = $(swaymsg -t get_outputs | grep name | grep -v eDP-1 | awk '{print $2}' | awk -F'"' '{print $2}')
