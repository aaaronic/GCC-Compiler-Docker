PRODUCT_NAME       = program

# You probably won't need to touch anything below here!!!
# The one exception is the cleanup stuff.

SOURCES            = $(wildcard *.c)
ASMSOURCES         = $(wildcard *.asm)

# --- File Names
BIN_NAME           = $(PRODUCT_NAME).bin

# --- Compiler
CC                 = gcc
CFLAGS             = -O2 -Wall -pedantic -Wextra -std=c99 -save-temps

# --- Linker
LD                 = gcc
LDFLAGS            = $(SPECS) $(MODEL) -lm

# --- Delete
RM                 = rm -f

COBJECTS = $(SOURCES:.c=.o)
OBJECTS = $(COBJECTS)


# --- Main build target

all: clean buildrun

buildrun: $(BIN_NAME)
	@echo -e "\n\nRunning Program:"
	@./$(BIN_NAME)
	@echo ""

# --- Build .o files into .bin file
$(BIN_NAME) : $(OBJECTS)
	@echo "Linking..."
	$(LD) $^ $(LDFLAGS) -o $@

# -- Build .c files into .o files
$(COBJECTS) : %.o : %.c
	@echo "Compiling..."
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	@echo "Cleaning..."
	$(RM) $(BIN_NAME)
	$(RM) *.o *.i *.s