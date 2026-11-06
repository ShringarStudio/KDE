#!/usr/bin/env bash
set -e

THEME_DIR="$(dirname "$(realpath "$0")")"
THEME_NAME="$(basename "$THEME_DIR")"
DEST="$HOME/.local/share/plasma/desktoptheme/$THEME_NAME"

if [ ! -d "$DEST" ]; then
    echo "'$THEME_NAME' is not installed at $DEST. Nothing to remove."
    exit 0
fi

echo "Uninstalling $THEME_NAME..."
rm -rf "$DEST"
echo "Done. '$THEME_NAME' removed from $DEST"
