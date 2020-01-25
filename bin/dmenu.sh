#!/bin/ksh
# vim: et ts=4
FONT="DejaVu Sans Mono:size=10"
dmenu_run -b -fn "$FONT" -nf "#ebdbb2" -nb "#282828" -sf "#282828" -sb "#458588" $@
