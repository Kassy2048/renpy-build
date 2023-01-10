#!/bin/bash

set -e


ROOT=$(cd $(dirname $0); pwd)
REFS=$ROOT
BASE="$ROOT"

# Needed to build things.
sudo apt-get install -y git build-essential ccache unzip autoconf autoconf-archive gcc-9 g++-9

# Needed to buyld python things.
sudo apt-get install -y python2-dev python3-dev python3-venv

# Needed to install python2 pip
sudo apt-get install -y curl

# Needed by renpy-build itself.
sudo apt-get install -y python3-jinja2

# Needed by sysroot.
sudo apt-get install -y debootstrap qemu-user-static

# Needed by gcc.
sudo apt-get install -y libgmp-dev libmpfr-dev libmpc-dev

# Needed by hostpython.
sudo apt-get install -y libssl-dev libbz2-dev

# Needed for mac
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y cmake clang libxml2-dev llvm

# Needed for web
sudo apt-get install -y quilt

# Install the standard set of packages needed to build Ren'Py.
sudo apt-get install -y \
    libavcodec-dev libavformat-dev \
    libswresample-dev libswscale-dev libfreetype6-dev libfribidi-dev libsdl2-dev \
    libsdl2-image-dev libsdl2-gfx-dev libsdl2-mixer-dev libsdl2-ttf-dev libjpeg-dev

# Clang is needed to compile for many platforms.
wget https://apt.llvm.org/llvm.sh
chmod +x llvm.sh
sudo ./llvm.sh 15

# Install the programs and virtualenvs.

VENV="$ROOT/tmp/virtualenv.py3"

export RENPY_DEPS_INSTALL=/usr::/usr/lib/x86_64-linux-gnu/

. $BASE/nightly/git.sh
. $BASE/nightly/python.sh
