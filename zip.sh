#!/bin/bash
zipping() {
    IMAGE="out/arch/arm64/boot/Image.gz-dtb"
    if [[ ! -f "$IMAGE" ]]; then
        echo "❌ ERROR: Kernel image not found at $IMAGE"
        echo "❌ Aborting zip process."
        return 1
    fi

    rm -rf AnyKernel
    unzip -q anykernel-template.zip -d .
    mv anykernel-template AnyKernel

    cp "$IMAGE" AnyKernel || return 1
    (
        cd AnyKernel || exit 1
        zip -r9 UBUNTU-KERNEL-RMX2020-BY-BHASKAR.zip .
    )
}
zipping
