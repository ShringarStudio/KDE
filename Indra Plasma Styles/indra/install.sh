#!/usr/bin/env bash
set -e

THEME_DIR="$(dirname "$(realpath "$0")")"
THEME_NAME="$(basename "$THEME_DIR")"
DEST="$HOME/.local/share/plasma/desktoptheme/$THEME_NAME"

echo "Installing $THEME_NAME..."

mkdir -p "$DEST"
# Copy theme files, excluding installer scripts
rsync -a --exclude='install.sh' --exclude='uninstall.sh' "$THEME_DIR/" "$DEST/" 2>/dev/null \
  || { find "$THEME_DIR" -mindepth 1 -not -name 'install.sh' -not -name 'uninstall.sh' | while IFS= read -r f; do
         rel="${f#$THEME_DIR/}"
         dst="$DEST/$rel"
         if [ -d "$f" ]; then mkdir -p "$dst"; else mkdir -p "$(dirname "$dst")"; cp "$f" "$dst"; fi
       done; }

echo "Done. '$THEME_NAME' installed to $DEST"
echo "You may need to re-select the theme in System Settings > Appearance > Plasma Style."
