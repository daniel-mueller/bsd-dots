#!/bin/ksh
# vim: et ts=4
FONT="Source Code Pro Medium:size=8"
dmenu_run -b -fn "$FONT" -nf "#efefef" -nb "#272727" -sf "#050505" -sb "#3399ff" $@
