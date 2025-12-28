local player = game.Players.LocalPlayer
local mouse = player:GetMouse()

-- GUI PRINCIPAL
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "BXNHub"
screenGui.ResetOnSpawn = false
screenGui.Parent = player:WaitForChild("PlayerGui")

-- BOTÓN DE ABRIR
local openButton = Instance.new("TextButton")
openButton.Name = "OpenInterface"
openButton.Size = UDim2.new(0, 60, 0, 60)
openButton.Position = UDim2.new(0, 20, 0.5, -30)
openButton.BackgroundColor3 = Color3.new(0, 0, 0)
openButton.BackgroundTransparency = 0.5
openButton.BorderColor3 = Color3.new(1, 1, 0)
openButton.BorderSizePixel = 2
openButton.Text = "BXN"
openButton.TextColor3 = Color3.new(1, 1, 1)
openButton.TextScaled = true
openButton.Parent = screenGui

-- HACERLO CÍRCULO
openButton.AutoButtonColor = true
openButton.ClipsDescendants = true
openButton.TextWrapped = true
openButton.UICorner = Instance.new("UICorner", openButton)
openButton.UICorner.CornerRadius = UDim.new(1, 0)

-- FRAME PRINCIPAL
local mainFrame = Instance.new("ScrollingFrame")
mainFrame.Name = "MainPanel"
mainFrame.Size = UDim2.new(0, 300, 0, 400)
mainFrame.Position = UDim2.new(0.5, -150, 0.5, -200)
mainFrame.BackgroundColor3 = Color3.new(0, 0, 0)
mainFrame.BackgroundTransparency = 0.5
mainFrame.BorderColor3 = Color3.new(1, 1, 0)
mainFrame.BorderSizePixel = 2
mainFrame.Visible = false
mainFrame.CanvasSize = UDim2.new(0, 0, 0, 600)
mainFrame.ScrollBarThickness = 8
mainFrame.Parent = screenGui

-- TÍTULO
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 40)
title.BackgroundTransparency = 1
title.Text = "BXN HUB"
title.TextColor3 = Color3.new(1, 1, 1)
title.Font = Enum.Font.GothamBold
title.TextScaled = true
title.Parent = mainFrame

-- SUBTÍTULO
local subtitle = Instance.new("TextLabel")
subtitle.Size = UDim2.new(1, 0, 0, 20)
subtitle.Position = UDim2.new(0, 0, 0, 40)
subtitle.BackgroundTransparency = 1
subtitle.Text = "made by Domingo_8460"
subtitle.TextColor3 = Color3.new(1, 1, 1)
subtitle.Font = Enum.Font.Gotham
subtitle.TextScaled = true
subtitle.Parent = mainFrame

-- FUNCIÓN PARA CREAR BOTONES
local function createButton(name, text, yPos)
    local btn = Instance.new("TextButton")
    btn.Name = name
    btn.Size = UDim2.new(0.9, 0, 0, 40)
    btn.Position = UDim2.new(0.05, 0, 0, yPos)
    btn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    btn.BorderColor3 = Color3.new(1, 1, 0)
    btn.Text = text
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.Font = Enum.Font.GothamBold
    btn.TextScaled = true
    btn.Parent = mainFrame
    return btn
end

-- BOTONES
local flyButton = createButton("FlyButton", "🕊️ Volar", 80)
local speedButton = createButton("SpeedButton", "⚡ Velocidad", 130)
local noclipButton = createButton("NoclipButton", "🚪 Atravesar paredes", 180)
local damageButton = createButton("DamageButton", "🎯 Daño a distancia", 230)
local espButton = createButton("ESPButton", "👁️ ESP Jugadores", 280)

-- ABRIR / CERRAR INTERFAZ
openButton.MouseButton1Click:Connect(function()
    mainFrame.Visible = not mainFrame.Visible
end)

-- ESP BÁSICO
espButton.MouseButton1Click:Connect(function()
    for _, plr in pairs(game.Players:GetPlayers()) do
        if plr ~= player and plr.Character and plr.Character:FindFirstChild("Head") then
            
            if plr.Character:FindFirstChild("BXN_ESP") then
                plr.Character.BXN_ESP:Destroy()
            end

            local distance = (player.Character.HumanoidRootPart.Position - plr.Character.HumanoidRootPart.Position).Magnitude

            local tag = Instance.new("BillboardGui")
            tag.Name = "BXN_ESP"
            tag.Size = UDim2.new(0, 200, 0, 50)
            tag.AlwaysOnTop = true
            tag.Parent = plr.Character.Head

            local label = Instance.new("TextLabel")
            label.Size = UDim2.new(1, 0, 1, 0)
            label.BackgroundTransparency = 1
            label.Text = plr.Name .. " - " .. math.floor(distance) .. " studs"
            label.TextColor3 = Color3.new(1, 1, 1)
            label.Font = Enum.Font.GothamBold
            label.TextScaled = true
            label.Parent = tag
        end
    end
end)
