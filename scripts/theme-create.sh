#!/usr/bin/env bash

FOLDER=~/.config/wal/colorschemes/dark

CHOICE="$(echo -e "create\nremove" | dmenu -c -l 15 -p "Theme creator|remover: ")"

case $CHOICE in
	create) NAME="$(echo "" | dmenu -c -p "Enter a name: ")" 
		wal -R -p $NAME ;;
	remove) rm -f $FOLDER/"$(echo -e "$(command ls -v $FOLDER)" | dmenu -c -l 15 -p "remove: ")" ;;
	*) exit ;;
esac
