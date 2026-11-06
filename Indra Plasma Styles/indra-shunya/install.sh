#!/usr/bin/env bash
set -e

THEME_DIR="$(dirname "$(realpath "$0")")"
THEME_NAME="$(basename "$THEME_DIR")"
DEST="$HOME/.local/share/plasma/desktoptheme/$THEME_NAME"

echo "Installing $THEME_NAME..."

mkdir -p "$DEST"
cp -r "$THEME_DIR"/. "$DEST/"

echo "Done. '$THEME_NAME' installed to $DEST"
echo "You may need to re-select the theme in System Settings > Appearance > Plasma Style."
