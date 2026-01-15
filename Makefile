CXX = g++ # Compiler
EMCC = emcc
WINCXX = x86_64-w64-mingw32-g++ # MinGW cross-compiler for Windows

CFLAGS = -std=c++20 -Wall -Wextra -O3 -lraylib

INCLUDE = -Iinclude/ # Flags

LFLAGS = -Llib/desktop/ -lraylib # Libraries 
EMLFLAGS = -Llib/web/ -lraylib -s USE_GLFW=3 -s USE_WEBGL2=1 -s ASYNCIFY -s TOTAL_MEMORY=256MB --preload-file AmbienceMachineLogo.png
WINLFLAGS = -Llib/windows -lraylib -lmingw32 -lglu32 -lopengl32 -lgdi32 -lwinmm -static-libgcc -static-libstdc++


SRCS = main.cpp # Recursively linking the source files

OBJS = $(SRCS:.cpp=.o) # Turning Source files into object files

EXEC = AmbianceMachine # Path to the binary
WASM_EXEC = AmbianceMachine.html
WIN_EXEC = AmbianceMachine.exe

PLATFORM ?= DESKTOP

ifeq (${PLATFORM}, DESKTOP)
all: $(EXEC) # Creating a default target

# Rule to create executable
$(EXEC): $(OBJS)
	$(CXX) -o $@ $^ $(LFLAGS)

# $@ is a shorthand for the target $(EXEC)
# $^ is a shorthand for the prerequisites $(OBJS)

# Rule to make source files object files
%.o : %.cpp
	#@echo "Building $@"
	$(CXX) $(CFLAGS) $(INCLUDE) -c -o $@ $<
# $< is a shorthand for the first prerequisite

# Cleaning target
clean:
	rm -f $(EXEC) $(OBJS)

move:
	@mkdir -p linux/
	@mkdir -p linux/res/
	touch linux/songsDir.txt
	mv AmbianceMachine linux/
	cp res/* linux/res/
	cp AmbianceMachineLogo.png linux/

.PHONY: all clean src
endif

ifeq ($(PLATFORM), WEB)
all: $(WASM_EXEC)

$(WASM_EXEC) : $(SRCS)
	$(EMCC) $(INCLUDE) $^ -o $@ $(EMLFLAGS)

clean: rm -f $(WASM_EXEC) *.wasm *.js *.html

.PHONY: all clean src
endif
ifeq ($(PLATFORM), WINDOWS)
all: $(WIN_EXEC)

$(WIN_EXEC): $(OBJS)
	$(WINCXX) -o $@ $^ $(WINLFLAGS)
	

%.o : %.cpp
	$(WINCXX) $(CFLAGS) $(INCLUDE) -c -o $@ $<

clean:
	rm -f $(WIN_EXEC) $(OBJS)

move:
	@mkdir -p windows/
	@mkdir -p windows/res/
	touch windows/songsDir.txt
	mv AmbianceMachine.exe windows/
	cp res/* windows/res/
	cp lib/windows/*.dll windows/
	cp AmbianceMachineLogo.png windows/

.PHONY: all clean src
endif