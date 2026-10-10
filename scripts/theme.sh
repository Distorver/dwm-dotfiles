#!/usr/bin/env bash

FOLDER=~/.config/wal/colorschemes/dark/
SCRIPT=~/.config/scripts/pywal.sh

NAME=$FOLDER"$(echo -e "$(command ls -v $FOLDER)" | dmenu -l 15 -c -p "Choose theme: ")"

wal -f $NAME -o $SCRIPT
