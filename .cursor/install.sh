#!/usr/bin/env bash
# Idempotent repository bootstrap for Cloud Agents. Runs from /workspace after
# checkout. System packages + PlatformIO come from .cursor/Dockerfile; this
# script only refreshes source-derived state and builds the native binary.
set -euo pipefail

cd "$(dirname "$0")/.."

git submodule update --init

# Pinned platform + libraries (see platformio.ini / variants/native).
pio pkg install --environment native

# Build the headless Linux (Portduino) meshtasticd binary.
pio run --environment native
