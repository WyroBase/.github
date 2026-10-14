#!/bin/sh
# Renders the README images from the HTML sources beside this script.
# Usage: sh design/render.sh   (from the repo root; needs Google Chrome)
set -e
cd "$(dirname "$0")"
CHROME="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
OUT=../profile/assets
shot() { # name width height theme
  "$CHROME" --headless=new --disable-gpu --hide-scrollbars --force-device-scale-factor=2 \
    --virtual-time-budget=6000 --window-size="$2,$3" \
    --screenshot="$OUT/$1-$4.png" "file://$PWD/$1.html?$4" >/dev/null 2>&1
}
for t in light dark; do
  shot banner 1280 420 "$t"
  shot terminal 1100 ${TERMINAL_H:-750} "$t"
done
ls -la "$OUT"
