return function(Context)
    local Library = Context.Library
    local ThemeManager = Context.ThemeManager
    local SaveManager = Context.SaveManager

    local Window = Library:CreateWindow({
        Title = "Projeto de Estudo",
        Footer = "Versão 0.1",
        Center = true,
        AutoShow = true,
        Resizable = true,
        ToggleKeybind = Enum.KeyCode.RightControl,
    })

    local Tabs = {
        Main = Window:AddTab("Principal", "home"),
        Settings = Window:AddTab("Configurações", "settings"),
    }

    local MainGroup =
        Tabs.Main:AddLeftGroupbox("Funções")

    MainGroup:AddToggle("ExampleToggle", {
        Text = "Ativar exemplo",
        Default = false,
        Tooltip = "Ativa uma função simples de estudo",
    })

    Library.Toggles.ExampleToggle:OnChanged(function()
        local enabled = Library.Toggles.ExampleToggle.Value

        if enabled then
            print("Função ativada")
        else
            print("Função desativada")
        end
    end)

    ThemeManager:SetLibrary(Library)
    SaveManager:SetLibrary(Library)

    ThemeManager:SetFolder("MeuProjeto")
    SaveManager:SetFolder("MeuProjeto/configs")

    SaveManager:BuildConfigSection(Tabs.Settings)
    ThemeManager:ApplyToTab(Tabs.Settings)

    SaveManager:LoadAutoloadConfig()
end