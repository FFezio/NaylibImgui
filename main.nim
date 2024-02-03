import raylib
import imgui
import src/NaylibImgui

initWindow(730,600,"hello!")

rlImGuiSetup(true)
var open = true
while not windowShouldClose():
    beginDrawing()
    clearBackground(White)
    rlImGuiBegin()
    igShowDemoWindow(addr(open))
    rlImGuiEnd()
    endDrawing()
rlImGuiShutdown()