#!/bin/sh

# Check if Spotify is running
if ! playerctl --player=spotify status >/dev/null 2>&1; then
    echo ""
    exit 0
fi

STATUS=$(playerctl --player=spotify status)
ARTIST=$(playerctl --player=spotify metadata artist)
TITLE=$(playerctl --player=spotify metadata title)

# Combine artist and title
FULL_TEXT="$ARTIST - $TITLE"
MAX_LEN=25 # Change this number to your preferred maximum length

# Truncate text if it exceeds the limit
if [ ${#FULL_TEXT} -gt $MAX_LEN ]; then
    DISPLAY_TEXT="$(echo "$FULL_TEXT" | cut -c 1-$MAX_LEN)..."
else
    DISPLAY_TEXT="$FULL_TEXT"
fi

# Output with play/pause indicator
if [ "$STATUS" = "Playing" ]; then
    echo "$DISPLAY_TEXT ▶"
elif [ "$STATUS" = "Paused" ]; then
    echo "$DISPLAY_TEXT ⏸"
else
    echo ""
fi

