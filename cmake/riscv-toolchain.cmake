# Specify the system and processor for RISC-V
set(CMAKE_SYSTEM_NAME           Generic)
set(CMAKE_SYSTEM_PROCESSOR      riscv64)

# Set RISC-V compilers
set(CMAKE_C_COMPILER            riscv64-unknown-elf-gcc)
set(CMAKE_CXX_COMPILER          riscv64-unknown-elf-g++)
set(CMAKE_ASM_COMPILER          riscv64-unknown-elf-gcc)
set(CMAKE_LINKER                riscv64-unknown-elf-ld)

# set(TOOLCHAIN_PREFIX   "${TOOLCHAIN_PATH}/arm-none-eabi-")
# set(CMAKE_C_COMPILER   "${TOOLCHAIN_PREFIX}gcc")
# set(CMAKE_ASM_COMPILER "${TOOLCHAIN_PREFIX}gcc")
# set(CMAKE_CXX_COMPILER "${TOOLCHAIN_PREFIX}g++")
# set(CMAKE_AR           "${TOOLCHAIN_PREFIX}ar")
# set(CMAKE_LINKER       "{TOOLCHAIN_PREFIX}ld")
# set(CMAKE_OBJCOPY      "${TOOLCHAIN_PREFIX}objcopy")
# set(CMAKE_RANLIB       "${TOOLCHAIN_PREFIX}ranlib")
# set(CMAKE_SIZE         "${TOOLCHAIN_PREFIX}size")
# set(CMAKE_STRIP        "${TOOLCHAIN_PREFIX}ld")

# Assume the compiler works (disable sanity checks)
set(CMAKE_C_COMPILER_WORKS      TRUE)
set(CMAKE_CXX_COMPILER_WORKS    TRUE)

# Clear macOS-specific flags
set(CMAKE_C_FLAGS_INIT          "")
set(CMAKE_CXX_FLAGS_INIT        "")
set(CMAKE_EXE_LINKER_FLAGS_INIT "")

# Add RISC-V specific flags
set(
    CMAKE_C_FLAGS_LIST
        ${CMAKE_C_FLAGS_INIT}
        -march=rv64g
        -mabi=lp64
        -static
        -mcmodel=medany
        -fvisibility=hidden
        -nostdlib
        -nostartfiles
        -O0
        -ggdb3
    )

string(JOIN " " CMAKE_C_FLAGS_STR "${CMAKE_C_FLAGS_LIST}")
string(REPLACE ";" " " CMAKE_C_FLAGS "${CMAKE_C_FLAGS_STR}")

set(CMAKE_ASM_FLAGS             "-O0 -ggdb3")
set(CMAKE_EXE_LINKER_FLAGS      "${CMAKE_EXE_LINKER_FLAGS_INIT} ${CMAKE_C_FLAGS}")