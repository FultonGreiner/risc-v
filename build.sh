#!/usr/bin/env bash

rm -rf build

mkdir build

cmake -S . -B build -DCMAKE_TOOLCHAIN_FILE=./cmake/riscv-toolchain.cmake

make -C build