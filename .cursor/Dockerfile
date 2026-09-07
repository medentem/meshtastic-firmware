# Cloud Agent base image for the Meshtastic firmware native (Portduino) dev loop.
# System packages mirror the builder stage of the repo-root Dockerfile so
# `pio run -e native` and `./bin/run-tests.sh` work out of the box.
FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Etc/UTC
ENV PIP_ROOT_USER_ACTION=ignore
ENV PIP_BREAK_SYSTEM_PACKAGES=1

# hadolint ignore=DL3008,DL3013
RUN apt-get update && apt-get install --no-install-recommends -y \
        curl wget g++ zip git ca-certificates pkg-config sudo \
        python3-pip python3-venv python3-grpc-tools \
        libgpiod-dev libyaml-cpp-dev libjsoncpp-dev libbluetooth-dev libi2c-dev libuv1-dev \
        libcurl4-gnutls-dev libusb-1.0-0-dev libulfius-dev liborcania-dev libssl-dev \
        libx11-dev libinput-dev libxkbcommon-x11-dev libsqlite3-dev libsdl2-dev \
    && apt-get clean && rm -rf /var/lib/apt/lists/* \
    && pip install --no-cache-dir -U platformio

# The ubuntu:24.04 image already ships a non-root `ubuntu` user (uid 1000).
USER ubuntu
