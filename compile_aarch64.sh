#!/bin/bash
export LC_ALL=C
export USE_CCACHE=1
export ARCH=arm64
export KBUILD_BUILD_HOST=ubuntu
export KBUILD_BUILD_USER="bhaskarkumar787878"

make -j$(nproc --all) O=out CC="clang" LLVM=1 CONFIG_NO_ERROR_ON_MISMATCH=y 2>&1 | tee build.log
