--[[
    --------------------------------------------------------------
    MOON HUB | BY MOON CAT
    Biblioteca: moonbrook.lua (Integrated Edition)
    Propriedade: Redz
    --------------------------------------------------------------
]]

-- Carregando a base da UI com suporte a animações
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

-- Configuração da Janela com Animação
local Window = Fluent:CreateWindow({
    Title = "Moon Hub | By Moon Cat",
    SubTitle = "moonbrook.lua",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true, -- Efeito de desfoque (Blur) atrás do menu
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl -- Tecla para esconder o menu
})

-- Abas do Hub
local Tabs = {
    Main = Window:AddTab({ Title = "Principal", Icon = "home" }),
    Settings = Window:AddTab({ Title = "Configurações", Icon = "settings" })
}

-- 1. SEÇÃO REDZ (SCRIPTS INTEGRADOS)
Tabs.Main:AddParagraph({
    Title = "Redz Property",
    Content = "Scripts exclusivos integrados ao Moon Hub."
})

Tabs.Main:AddButton({
    Title = "Executar Redz Scripts",
    Description = "Carrega as funções da Redz no jogo atual",
    Callback = function()
        Window:Dialog({
            Title = "Redz System",
            Content = "Iniciando integração Redz...",
            Buttons = {
                {
                    Title = "Confirmar",
                    Callback = function()
                        print("Redz scripts executados!")
                        -- O seu script bruto da Redz entraria aqui
                    end
                },
                {
                    Title = "Cancelar"
                }
            }
        })
    end
})

-- 2. FUNÇÕES DE JOGADOR (EXEMPLO COM TWEEN ANIMATION)
Tabs.Main:AddSlider("WalkSpeed", {
    Title = "Velocidade do Personagem",
    Description = "Ajuste a velocidade com suavidade",
    Default = 16,
    Min = 16,
    Max = 300,
    Rounding = 1,
    Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
    end
})

-- 3. ANIMAÇÃO DE NOTIFICAÇÃO AO CARREGAR
Fluent:Notify({
    Title = "Moon Hub",
    Content = "A biblioteca moonbrook.lua foi carregada com sucesso!",
    SubContent = "By Moon Cat",
    Duration = 5
})

-- Finalização
SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({})
InterfaceManager:BuildInterfaceSection(Tabs.Settings)
Window:SelectTab(1)

print("Moon Hub | By Moon Cat carregado!")

