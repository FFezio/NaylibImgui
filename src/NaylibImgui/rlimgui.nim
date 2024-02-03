import imgui
import raylib

{.compile:"rlImGui/rlImGui.cpp".}
{.push header:"rlImGui/rlImGui.h".}

proc ReloadFonts*(): void 
proc SetupFontAwesome*():void
proc SetupBackend*():void 
proc rlImGuiEndInitImGui*():void
proc rlImGuiBeginInitImGui*():void
proc rlImGuiSetup*(dark:bool=true):void ## sets up ImGui with ether a dark or light default theme
proc rlImGuiReloadFonts*():void
proc rlImGuiBegin*():void
proc rlImGuiBeginDelta*(deltaTime:cfloat):void
proc rlImGuiEnd*():void
proc rlImGuiShutdown*():void 
proc rlImGuiImage*(image: var Texture):void 
proc rlImGuiImageButton*(name:var cstring, image: var Texture):bool 
proc rlImGuiImageButtonSize*(name: var cstring, image: var Texture, size:ImVec2):bool 
proc rlImGuiImageSize*(image: var Texture, width:cint, height:cint):void 
proc rlImGuiImageSizeV*(image: var Texture, size:Vector2):void 
proc rlImGuiImageRect*(image: var Texture, destWidth:cint, destHeight:cint, sourceRect:Rectangle):void 
proc rlImGuiImageRenderTexture*(image:var RenderTexture):void
proc rlImGuiImageRenderTextureFit*(image:var RenderTexture, center:bool):void

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

initWindow(730,600,"hello!")

rlImGuiSetup(false)
var open = true
while not windowShouldClose():
    beginDrawing()
    clearBackground(White)
    rlImGuiBegin()
    igShowDemoWindow(addr(open))
    rlImGuiEnd()
    endDrawing()
rlImGuiShutdown()