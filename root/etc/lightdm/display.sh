#!/bin/sh

display=$(xrandr | grep ' connected' | cut -d' ' -f1)
xrandr --output "$display" --primary --mode 1920x1080 --pos 0x0 --rotate normal

#xrandr --output "$display" --auto

