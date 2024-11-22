#!/usr/bin/env bash

# qemu-system-riscv64 \
#     -machine virt \
#     -nographic \
#     -gdb tcp::1234,ipv4 \
#     -bios ./build/riscv-project.elf

qemu-system-riscv64 \
    -machine sifive_u \
    -nographic \
    -bios none \
    -gdb tcp::1234,ipv4 \
    -kernel ./build/riscv-project.elf