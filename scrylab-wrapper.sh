#!/bin/sh

set -eu

APP_DIR="/app/lib/ScryLab.dist"
APP_BIN="$APP_DIR/ScryLab"

if [ ! -x "$APP_BIN" ]; then
    echo "ScryLab: bundled binary not found at $APP_BIN" >&2
    echo "The bundled app files are missing. Re-install the Flatpak." >&2
    exit 1
fi

exec "$APP_BIN" "$@"
