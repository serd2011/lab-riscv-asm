TARGET = Lab1
BUILD_DIR = build

ISA = rv32i
ABI = ilp32

C_SOURCES =  \
src/c/Lab1.c \


# Compiler

PREFIX = riscv64-unknown-elf-

ifdef GCC_PATH
	CC = $(GCC_PATH)/$(PREFIX)gcc
	OD = $(GCC_PATH)/$(PREFIX)objdump
else
	CC = $(PREFIX)gcc
	OD = $(PREFIX)objdump
endif

ARCHITECTURE_FLAGS += -march=$(ISA) -mabi=$(ABI)


# Build App
all: $(BUILD_DIR)/$(TARGET).elf


# Build tarrgets

OBJECTS = $(addprefix $(BUILD_DIR)/,$(notdir $(C_SOURCES:.c=.o)))
vpath %.c $(sort $(dir $(C_SOURCES)))

$(BUILD_DIR)/$(TARGET).elf: $(OBJECTS)
	$(CC) $(ARCHITECTURE_FLAGS) $(OBJECTS) -o $@

$(BUILD_DIR)/%.o: %.c | $(BUILD_DIR)
	$(CC) -c $(ARCHITECTURE_FLAGS) $< -o $@

$(BUILD_DIR):
	mkdir $@


# Dump app
dump: $(BUILD_DIR)/$(TARGET).dump

$(BUILD_DIR)/$(TARGET).dump: $(BUILD_DIR)/$(TARGET).elf
	$(OD) -D $< > $@


# Cleaning
clean:
	rm -rf $(BUILD_DIR)
