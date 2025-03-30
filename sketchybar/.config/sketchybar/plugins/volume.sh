#!/usr/bin/env zsh

if [ "$SENDER" = "volume_change" ]; then
  VOLUME="$INFO"

  case "$VOLUME" in
    [4-9][0-9]|100) ICON=" "
    ;;
    0) ICON=" "
    ;;
    *) ICON=" "
    ;;
  esac

  sketchybar --set "$NAME" icon="$ICON" label="$VOLUME%"
fi
