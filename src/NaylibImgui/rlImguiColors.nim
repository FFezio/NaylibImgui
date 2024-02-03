import imgui
import raylib

## utility functions from rlImGuiColors.h
proc Convert*(color:Color):ImVec4=
    ## Converts a raylib color into a imgui colors
    ImVec4(x:color.r.float32 / 255.0.float32, y:color.g.float32 / 255.0.float32, z:color.b.float32 / 255.0.float32, w:color.a.float32 / 255.0.float32);

proc Convert*(color:ImVec4):Color=
    ## Converts a imgui color into a raylib colors
    Color(r:(color.x * 255.0.float32).uint8, g:(color.y * 255.0.float32).uint8, b:(color.z * 255.0.float32).uint8, a:(color.w * 255.0.float32).uint8);
