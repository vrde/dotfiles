#!/bin/sh
LINES=$(tput lines)
LINES=$(expr $LINES - 20)
LINES=20
clear
git --no-pager lt -n$LINES
while inotifywait .git; do clear && git --no-pager lt -n$LINES; done
