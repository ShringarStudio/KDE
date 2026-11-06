#!/usr/bin/env bash
set -e

SCHEME_DIR="$(dirname "$(realpath "$0")")"
DEST="$HOME/.local/share/color-schemes"

echo "Uninstalling Indra color schemes..."

removed=0
for f in "$SCHEME_DIR"/*.colors; do
    fname="$(basename "$f")"
    if [ -f "$DEST/$fname" ]; then
        rm "$DEST/$fname"
        echo "  Removed $fname"
        removed=$((removed + 1))
    fi
done

if [ "$removed" -eq 0 ]; then
    echo "No Indra color schemes found in $DEST. Nothing to remove."
else
    echo "Done. $removed scheme(s) removed."
fi
