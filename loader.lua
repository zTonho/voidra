local BASE_URL =
    "https://raw.githubusercontent.com/zTonho/voidra/refs/heads/main/"

local function LoadFile(path)
    local url = BASE_URL .. path
    local source = game:HttpGet(url)

    local compiledFunction, compileError =
        loadstring(source, "@" .. path)

    assert(
        compiledFunction,
        string.format("Erro ao compilar %s: %s", path, tostring(compileError))
    )

    return compiledFunction()
end

local Library = LoadFile("Library.lua")
local ThemeManager = LoadFile("addons/ThemeManager.lua")
local SaveManager = LoadFile("addons/SaveManager.lua")
local StartApplication = LoadFile("main.lua")

StartApplication({
    Library = Library,
    ThemeManager = ThemeManager,
    SaveManager = SaveManager,
})