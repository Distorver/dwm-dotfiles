#!/usr/bin/env bash

FOLDER=~/Pictures/wallpapers
SCRIPTS=~/.config/scripts/pywal.sh

WALL=$FOLDER/$(echo -e "$(command ls -v $FOLDER)" | dmenu -c -l 15 -i -p "wallpaper: ")

feh --bg-fill $WALL && wal -i $WALL -o $SCRIPTS
notify-send --icon=$WALL "Wallpaper has changed" $WALL
