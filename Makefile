# ============================================================
# Makefile for Assembly development (x86_64 / i386)
# Compatible with Arch Linux + NASM + GCC
# Author: elwnc
# ============================================================

# --- Configuration ---
TARGET      := build/main
SRC         := src/main.asm
OBJ         := build/$(TARGET).o
BIN         := $(TARGET)
ARCH        ?= 64
NASM        := nasm
RM          := rm -f

# --- Flags ---
ifeq ($(ARCH),64)
    NASM_FLAGS := -f elf64
    LD_FLAGS   := -no-pie
else
    NASM_FLAGS := -f elf32
    LD_FLAGS   := -m32 -no-pie
endif

# --- Default rule ---
all: $(BIN)

$(OBJ): $(SRC)
	@echo "Assembling: $< -> $@"
	$(NASM) $(NASM_FLAGS) $< -o $@

$(BIN): $(OBJ)
	@echo "Linking: $@"
	ld $(LD_FLAGS) $< -o $@

# --- Run target ---
run: $(BIN)
	@echo "Running program:"
	@./$(BIN)

# --- Clean build files ---
clean:
	@echo "Cleaning build files..."
	$(RM) $(OBJ) $(BIN)

# --- Phony targets ---
.PHONY: all run clean debug
