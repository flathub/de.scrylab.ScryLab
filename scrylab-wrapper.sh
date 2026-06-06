#!/bin/sh

set -eu

APP_DIR="/app/lib/ScryLab.dist"
APP_BIN="$APP_DIR/ScryLab"

if [ ! -x "$APP_BIN" ]; then
    echo "ScryLab: bundled binary not found at $APP_BIN" >&2
    echo "The bundled app files are missing. Re-install the Flatpak." >&2
    exit 1
fi

if [ -z "${QT_QPA_PLATFORM:-}" ]; then
    if [ -n "${WAYLAND_DISPLAY:-}" ]; then
        export QT_QPA_PLATFORM="wayland"
    elif [ -n "${DISPLAY:-}" ]; then
        export QT_QPA_PLATFORM="xcb"
    fi
fi

export QT_PLUGIN_PATH="$APP_DIR/PySide6/qt-plugins:${QT_PLUGIN_PATH:-}"

exec "$APP_BIN" "$@"
