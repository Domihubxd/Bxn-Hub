local player = game.Players.LocalPlayer
local mouse = player:GetMouse()

-- Crear GUI
local screenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
screenGui.Name = "BXNHub"
screenGui.ResetOnSpawn = false

-- Botón de abrir
local openButton = Instance.new("ImageButton", screenGui)
openButton.Name = "OpenInterface"
openButton.Size = UDim2.new(0, 60, 0, 60)
openButton.Position = UDim2.new(0, 20, 0.5, -30)
openButton.BackgroundColor3 = Color3.new(0, 0, 0)
openButton.BackgroundTransparency = 0.5
openButton.BorderColor3 = Color3.new(1, 1, 0)
openButton.BorderSizePixel = 2
openButton.Image = ""
openButton.AutoButtonColor = true
openButton.ZIndex = 2
openButton.Text = "BXN"
openButton.TextColor3 = Color3.new(1, 1, 1)
openButton.TextScaled = true
openButton.ClipsDescendants = true
openButton.AnchorPoint = Vector2.new(0, 0)
openButton.Shape = Enum.ButtonShape.Circle

-- Frame principal
local mainFrame = Instance.new("ScrollingFrame", screenGui)
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

-- Título
local title = Instance.new("TextLabel", mainFrame)
title.Size = UDim2.new(1, 0, 0, 40)
title.Position = UDim2.new(0, 0, 0, 0)
title.BackgroundTransparency = 1
title.Text = "BXN HUB"
title.TextColor3 = Color3.new(1, 1, 1)
title.Font = Enum.Font.Cartoon
title.TextScaled = true

-- Subtítulo
local subtitle = Instance.new("TextLabel", mainFrame)
subtitle.Size = UDim2.new(1, 0, 0, 20)
subtitle.Position = UDim2.new(0, 0, 0, 40)
subtitle.BackgroundTransparency = 1
subtitle.Text = "made by Domingo_8460"
subtitle.TextColor3 = Color3.new(1, 1, 1)
subtitle.Font = Enum.Font.Cartoon
subtitle.TextScaled = true

-- Función para crear botones
local function createButton(name, text, yPos)
	local btn = Instance.new("TextButton", mainFrame)
	btn.Name = name
	btn.Size = UDim2.new(0.9, 0, 0, 40)
	btn.Position = UDim2.new(0.05, 0, 0, yPos)
	btn.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
	btn.BorderColor3 = Color3.new(1, 1, 0)
	btn.Text = text
	btn.TextColor3 = Color3.new(1, 1, 1)
	btn.Font = Enum.Font.Cartoon
	btn.TextScaled = true
	return btn
end

-- Botones
local flyButton = createButton("FlyButton", "🕊️ Volar", 70)
local speedButton = createButton("SpeedButton", "⚡ Velocidad", 120)
local noclipButton = createButton("NoclipButton", "🚪 Atravesar paredes", 170)
local damageButton = createButton("DamageButton", "🎯 Daño a distancia", 220)
local espButton = createButton("ESPButton", "👁️ Ver jugadores", 270)

-- Abrir interfaz
openButton.MouseButton1Click:Connect(function()
	mainFrame.Visible = not mainFrame.Visible
end)

-- ESP básico
espButton.MouseButton1Click:Connect(function()
	for _, plr in pairs(game.Players:GetPlayers()) do
		if plr ~= player and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
			local distance = (player.Character.HumanoidRootPart.Position - plr.Character.HumanoidRootPart.Position).Magnitude
			local tag = Instance.new("BillboardGui", plr.Character.Head)
			tag.Size = UDim2.new(0, 200, 0, 50)
			tag.AlwaysOnTop = true
			local label = Instance.new("TextLabel", tag)
			label.Size = UDim2.new(1, 0, 1, 0)
			label.BackgroundTransparency = 1
			label.Text = plr.Name .. " - " .. math.floor(distance) .. " studs"
			label.TextColor3 = Color3.new(1, 1, 1)
			label.Font = Enum.Font.Cartoon
			label.TextScaled = true
		end
	end
end)
