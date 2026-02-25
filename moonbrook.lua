--[[
    --------------------------------------------------------------
    MOON HUB | BY MOON CAT
    Link: https://raw.githubusercontent.com/MOONCAT-HUB/Moon-Hub/main/moonbrook.lua
    --------------------------------------------------------------
]]

-- Carregando a interface Fluent (Uma das melhores com animações)
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

-- Criando a janela principal com efeito de desfoque e animação
local Window = Fluent:CreateWindow({
    Title = "Moon Hub | By Moon Cat",
    SubTitle = "moonbrook.lua",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true, 
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl
})

-- Abas do Menu
local Tabs = {
    Main = Window:AddTab({ Title = "Principal", Icon = "home" }),
    Scripts = Window:AddTab({ Title = "Redz Integrado", Icon = "code" }),
    Settings = Window:AddTab({ Title = "Configurações", Icon = "settings" })
}

-- 1. NOTIFICAÇÃO DE ABERTURA (ANIMAÇÃO)
Fluent:Notify({
    Title = "Moon Hub",
    Content = "Bem-vindo de volta, MoonCat!",
    SubContent = "Biblioteca moonbrook.lua carregada",
    Duration = 5
})

-- 2. ABA PRINCIPAL
Tabs.Main:AddParagraph({
    Title = "Status do Sistema",
    Content = "O Moon Hub está rodando perfeitamente.\nPropriedade de Moon Cat e Redz."
})

-- 3. ABA REDZ (ONDE VOCÊ VAI INTEGRAR SEUS SCRIPTS)
Tabs.Scripts:AddSection("Scripts da Redz")

Tabs.Scripts:AddButton({
    Title = "Carregar Módulos Redz",
    Description = "Executa a integração total com a Redz",
    Callback = function()
        Window:Dialog({
            Title = "Integração",
            Content = "Deseja injetar os scripts Redz agora?",
            Buttons = {
                {
                    Title = "Sim",
                    Callback = function()
                        print("Redz Injetado!")
                        -- Cole aqui o código bruto da Redz se quiser que ele rode ao clicar
                    end
                },
                { Title = "Não" }
            }
        })
    end
})

-- 4. FUNÇÕES DE PLAYER (COM SLIDERS ANIMADOS)
Tabs.Main:AddSection("Modificações de Jogador")

Tabs.Main:AddSlider("WalkSpeed", {
    Title = "Velocidade",
    Description = "Aumenta a velocidade do boneco",
    Default = 16,
    Min = 16,
    Max = 300,
    Rounding = 1,
    Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
    end
})

-- Selecionar a primeira aba ao abrir
Window:SelectTab(1)
