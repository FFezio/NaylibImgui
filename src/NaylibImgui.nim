import imgui
import raylib
import os
export imgui
# nim by default looks into the cache folder for the header files
# with this we make nim to search into our project folder for the header file instead
const rlImguiPath = currentSourcePath.parentDir & "/NaylibImgui/rlImGui/rlImGui.h" 
{.compile:"NaylibImgui/rlImGui/rlImGui.cpp".}
{.push importc, header:rlImguiPath.}

proc ReloadFonts*(): void 
proc SetupFontAwesome*():void
proc SetupBackend*():void 
proc rlImGuiEndInitImGui*():void

## End Custom initialization. Not needed if you call rlImGuiSetup. Only needed if you want to add custom setup code.
## must be proceeded by rlImGuiBeginInitImGui
## Called by ImGui_ImplRaylib_Init and does the second part of setup, and renders fonts.

proc rlImGuiBeginInitImGui*():void
## Custom initialization. Not needed if you call rlImGuiSetup. Only needed if you want to add custom setup code.
## must be followed by rlImGuiEndInitImGui
## Called by ImGui_ImplRaylib_Init, and does the first part of setup, before fonts are rendered

proc rlImGuiSetup*(dark:bool=true):void
## Sets up ImGui  with ether a dark or light default theme, loads fonts and themes
## Calls ImGui_ImplRaylib_Init and sets the theme. Will install Font awesome by default

proc rlImGuiReloadFonts*():void
## Forces the font texture atlas to be recomputed and re-cached

proc rlImGuiBegin*():void
## starts the ImGui content mode. Make all ImGui calls after this

proc rlImGuiBeginDelta*(deltaTime:cfloat):void
## Starts a new ImGui Frame with a specified delta time

proc rlImGuiEnd*():void
## Ends an ImGui frame and submits all ImGui drawing to raylib for processing.
## Calls ImGui:Render, an d ImGui_ImplRaylib_RenderDrawData to draw to the current raylib render target

proc rlImGuiShutdown*():void
## cleans up ImGui

proc rlImGuiImage*(image: var Texture):void
## Draw a texture as an image in an ImGui Context
## Uses the current ImGui Cursor position and the full texture size.

proc rlImGuiImageButton*(name:var cstring, image: var Texture):bool 
## Draws a texture as an image button in an ImGui context. Uses the current ImGui cursor position and the specified size.

proc rlImGuiImageButtonSize*(name: var cstring, image: var Texture, size:ImVec2):bool 
## Draws a texture as an image button in an ImGui context. Uses the current ImGui cursor position and the specified size.

proc rlImGuiImageSize*(image: var Texture, width:cint, height:cint):void
## Draw a texture as an image in an ImGui Context at a specific size
## Uses the current ImGui Cursor position and the specified width and height

proc rlImGuiImageSizeV*(image: var Texture, size:Vector2):void
## Draw a portion texture as an image in an ImGui Context at a defined size
## Uses the current ImGui Cursor position and the specified size
## The image will be scaled up or down to fit as needed

proc rlImGuiImageRect*(image: var Texture, destWidth:cint, destHeight:cint, sourceRect:Rectangle):void 
## Draw a portion texture as an image in an ImGui Context at a defined size
## Uses the current ImGui Cursor position and the specified size
## The image will be scaled up or down to fit as needed

proc rlImGuiImageRenderTexture*(image:var RenderTexture):void
## Draws a render texture as an image an ImGui Context, automatically flipping the Y axis so it will show correctly on screen

proc rlImGuiImageRenderTextureFit*(image:var RenderTexture, center:bool):void
## Draws a render texture as an image an ImGui Context, automatically flipping the Y axis so it will show correctly on screen
## Fits the render texture to the available content area


{.push importcpp:"rlImGui/rlImGui.cpp".}
# raw imgui backend api
proc ImGui_ImplRaylib_Init*():bool
proc Imgui_ImplRaylib_BuildFontAtlas*():bool
proc ImGui_ImplRaylib_Shutdown*():bool
proc ImGui_ImplRaylib_NewFrame*():void
proc ImGui_ImplRaylib_RenderDrawData*(draw_data:ImDrawData):void
proc HandleGamepadButtonEvent*(io: var ImGuiIO , button:GamepadButton, key: ImGuiKey)
proc HandleGamepadStickEvent*(io: var ImGuiIO, axis: GamepadAxis, negKey: ImGuiKey, posKey: ImGuiKey)
proc ImGui_ImplRaylib_ProcessEvents*():bool


## utility functions from rlImGuiColors.h
proc Convert*(color:Color):ImVec4=
    ## Converts a raylib color into a imgui colors
    ImVec4(x:color.r.float32 / 255.0.float32, y:color.g.float32 / 255.0.float32, z:color.b.float32 / 255.0.float32, w:color.a.float32 / 255.0.float32);

proc Convert*(color:ImVec4):Color=
    ## Converts a imgui color into a raylib colors
    Color(r:(color.x * 255.0.float32).uint8, g:(color.y * 255.0.float32).uint8, b:(color.z * 255.0.float32).uint8, a:(color.w * 255.0.float32).uint8);
