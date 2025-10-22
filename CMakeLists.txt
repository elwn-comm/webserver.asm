cmake_minimum_required(VERSION 3.20)
project(WebServerASM ASM_NASM)

# Source files
set(SOURCES
    src/main.asm
    src/socket.asm
    src/convert.asm
    src/logging.asm
)

# Architecture selection
if(CMAKE_SYSTEM_PROCESSOR MATCHES "x86_64")
    set(ARCH "elf64")
else()
    set(ARCH "elf32")
endif()

# NASM flags
set(CMAKE_ASM_NASM_OBJECT_FORMAT ${ARCH})
set(CMAKE_ASM_NASM_FLAGS "-Wall")

add_executable(webserver ${SOURCES})
