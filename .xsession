#!/bin/ksh
export ENV=$HOME/.kshrc

export LANG=de_DE.UTF-8

if [ -x /usr/local/bin/dbus-launch -a -z "${DBUS_SESSION_BUS_ADDRESS}" ]; then
  eval `dbus-launch --sh-syntax --exit-with-session`
fi

xset b off
xset fp rehash
fc-cache -v

compton &
dunst &
urxvtd -q -o -f &
feh --bg-scale ~/wallpaper.png &
xrdb -merge ~/.Xresources &

export LC_CTYPE="de_DE.UTF-8"

xinput set-prop "/dev/wsmouse" "WS Pointer Wheel Emulation" 1
xinput set-prop "/dev/wsmouse" "WS Pointer Wheel Emulation Button" 2
xinput set-prop "/dev/wsmouse" "WS Pointer Wheel Emulation Axes" 6 7 4 5

cwm -v 1>~/cwm.log 2>&1
