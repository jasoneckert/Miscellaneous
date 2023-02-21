#!/bin/bash
# Download Fedora Server aarch64 system image (fedora-version-aarch64.img) to /VMs and decompress using unxz
# This assumes 16GB RAM (16384) and 8 virtual CPU cores
qemu-system-aarch64 \
    -no-user-config \
    -nodefaults \
    -display none \
    -m 16384 \
    -cpu cortex-a57 -machine virt \
    -smp 8 \
    -bios /usr/share/edk2/aarch64/QEMU_EFI.fd \
    -device virtio-scsi-device,id=scsi \
    -drive file=/VMs/fedora-version-aarch64.img,format=raw,if=none,id=hd0 -device scsi-hd,drive=hd0 \
    -netdev user,id=usernet -device virtio-net-device,netdev=usernet \
    -boot efi \
    -serial mon:stdio
