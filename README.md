# Raylib Template
A **decent** template for Raylib projects. This template was specifically made for games, but can be used for regular applications as well with some small tweaks.

## Requirements
First you need to have these dependencies installed:
- make
- C/C++ compiler of your choice
- Emscripten (For WASM only)

## Usage
Use the make command to build. The default target is linux.
```bash
make
```

If you want to explicitly set the target platform, use the `PLATFORM` flag.
```bash
make PLATFORM=LINUX
make PLATFORM=WINDOWS # x64 Windows binary
make PLATFORM=WEB
```

> [!NOTE]
> Stronger support will be added for windows and wasm in the future.

Enjoy!
