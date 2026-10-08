#!/bin/bash

# Get the currently active power profile
CURRENT=$(powerprofilesctl get)

# Cycle through profiles: balanced -> performance -> power-saver -> balanced
case "$CURRENT" in
    "balanced")
        powerprofilesctl set performance
        ;;
    "performance")
        powerprofilesctl set power-saver
        ;;
    "power-saver"|*)
        powerprofilesctl set balanced
        ;;
esac

