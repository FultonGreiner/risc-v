cmake_minimum_required(VERSION 3.20)

# Project settings
set(PROJECT_NAME                    "riscv-project")
set(CMAKE_EXPORT_COMPILE_COMMANDS   TRUE)

# Define the project
project(${PROJECT_NAME} LANGUAGES ASM C)

set(CMAKE_EXECUTABLE_SUFFIX         ".elf")

set(PROJECT_BIN                     "${PROJECT_NAME}.bin")
set(PROJECT_ELF                     "${PROJECT_NAME}${CMAKE_EXECUTABLE_SUFFIX}")

# Add source files
add_executable(
    ${CMAKE_PROJECT_NAME}
        src/startup/startup.s
)

# Specify the linker script
target_link_options(${CMAKE_PROJECT_NAME} PRIVATE -T ${CMAKE_SOURCE_DIR}/linker.ld)

# Post-build: Generate binary file from ELF
# add_custom_command(
#     TARGET ${CMAKE_PROJECT_NAME} POST_BUILD
#         COMMAND riscv64-unknown-elf-objcopy -O binary ${PROJECT_ELF} ${PROJECT_BIN}
#         COMMENT "Generating binary file from ELF"
# )
