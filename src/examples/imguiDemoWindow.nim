import ../NaylibImgui
import raylib
import imgui


initWindow(730,600,"Demo window") ## creates the raylib window
rlImGuiSetup() ## sets imgui with dark theme
var open = true
while not windowShouldClose():
    beginDrawing()
    clearBackground(White)
    rlImGuiBegin()
    igShowDemoWindow(addr(open))
    rlImGuiEnd()
    endDrawing()

rlImGuiShutdown()
closeWindow()