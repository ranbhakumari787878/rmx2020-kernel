#!/bin/bash
rm -rf AnyKernel/
zipping() {
    IMAGE="out/arch/arm64/boot/Image.gz-dtb"
    if [[ ! -f "$IMAGE" ]]; then
        echo "❌ ERROR: Kernel image not found at $IMAGE"
        echo "❌ Aborting zip process."
        return 1
    fi

    rm -rf AnyKernel
    git clone --depth=1 https://github.com/sarthakroy2002/AnyKernel3.git AnyKernel || return 1
    cp "$IMAGE" AnyKernel || return 1
    (
        cd AnyKernel || exit 1
        zip -r9 UBUNTU-KERNEL-RMX2020-BY-BHASKAR.zip .
    )
}
zipping

rm build.log
cp AnyKernel/UBUNTU*.zip releze/
rm -rf AnyKernel/
