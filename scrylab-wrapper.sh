#!/bin/sh

set -eu

APP_DIR="/app/lib/ScryLab.dist"
APP_BIN="$APP_DIR/ScryLab"

exec "$APP_BIN" "$@"
