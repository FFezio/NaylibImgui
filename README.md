# Nim Bindings for rlImgui

This repository contains Nim bindings for the [rlImgui](https://github.com/raylib-extras/rlImGui/tree/main) library, enabling developers to integrate Dear ImGui with raylib applications in Nim projects.

## Introduction

rlImgui is a lightweight binding of the original rlImgui library designed to facilitate the integration of Dear ImGui (a popular GUI library) with raylib (a simple and easy-to-use game development framework). These bindings provide Nim developers with access to the powerful features of Dear ImGui within their raylib applications.

### Prerequisites

- Ensure to use the `--backend:cpp` option when compiling your Nim code.
- Need to install [naylib](https://github.com/planetis-m/naylib) (nim bindings for raylib) into your project
- No need to install imgui for Nim, as it's already integrated.
- Refer to the rlImgui documentation for detailed information on integrating ImGui with raylib.

## Features
- Direct integration with raylib for rendering ImGui content.

## Usage

To use the rlImgui bindings in your Nim project:

1. Include the bindings in your Nim source files.
2. Call the provided procedures to set up ImGui, reload fonts, and begin/end ImGui frames.
3. Refer to the provided documentation and the rlImgui documentation for detailed usage instructions.

```nim
import NaylibImgui
import raylib

initWindow(720,480,"Demo window") ## creates the raylib window
rlImGuiSetup() ## sets imgui with a dark theme
var open = true
while not windowShouldClose():
    beginDrawing()
    clearBackground(White)

    rlImGuiBegin()
    ## your imgui calls here
    igShowDemoWindow(addr(open))

    rlImGuiEnd()
    endDrawing()

rlImGuiShutdown()
closeWindow()
```

## Documentation

For detailed information on using rlImgui, refer to the official rlImgui documentation.

## Contributing

Contributions to this project are welcome! If you find any issues or would like to suggest improvements, feel free to open an issue or submit a pull request.

## License

This project is licensed under the [MIT License](LICENSE).

---

Your README is already well-structured and provides clear instructions for users. Keep up the good work!
