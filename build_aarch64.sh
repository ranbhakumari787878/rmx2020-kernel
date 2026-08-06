#!/bin/bash
export LC_ALL=C
export USE_CCACHE=1
export ARCH=arm64
export KBUILD_BUILD_HOST=ubuntu
export KBUILD_BUILD_USER="bhaskarkumar787878"

mkdir -p out
make O=out ARCH=arm64 RMX2020_defconfig
