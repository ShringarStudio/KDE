#!/usr/bin/env bash
set -e

SCHEME_DIR="$(dirname "$(realpath "$0")")"
DEST="$HOME/.local/share/color-schemes"

echo "Installing Indra color schemes..."

mkdir -p "$DEST"
cp "$SCHEME_DIR"/*.colors "$DEST/"

echo "Done. Color schemes installed to $DEST:"
for f in "$SCHEME_DIR"/*.colors; do
    echo "  - $(basename "$f")"
done
echo "You may need to re-select the color scheme in System Settings > Appearance > Colors."
