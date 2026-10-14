
-- Roblox Studio LocalScript
-- Red & Black UI Demo

local Players = game:GetService("Players")
local player = Players.LocalPlayer

local gui = Instance.new("ScreenGui")
gui.Name = "RedBlackUI"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local main = Instance.new("Frame")
main.Size = UDim2.new(0, 280, 0, 190)
main.Position = UDim2.new(0.5, -140, 0.5, -95)
main.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
main.BorderSizePixel = 0
main.Parent = gui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = main

local stroke = Instance.new("UIStroke")
stroke.Color = Color3.fromRGB(255, 35, 35)
stroke.Thickness = 2
stroke.Parent = main

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -45, 0, 45)
title.Position = UDim2.new(0, 12, 0, 0)
title.BackgroundTransparency = 1
title.Text = "RED  /  BLACK"
title.TextColor3 = Color3.fromRGB(255, 45, 45)
title.TextSize = 20
title.Font = Enum.Font.GothamBold
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = main

local close = Instance.new("TextButton")
close.Size = UDim2.new(0, 32, 0, 32)
close.Position = UDim2.new(1, -40, 0, 7)
close.BackgroundColor3 = Color3.fromRGB(130, 20, 20)
close.Text = "X"
close.TextColor3 = Color3.new(1, 1, 1)
close.Font = Enum.Font.GothamBold
close.TextSize = 16
close.Parent = main

local function makeButton(text, y)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, -24, 0, 42)
    button.Position = UDim2.new(0, 12, 0, y)
    button.BackgroundColor3 = Color3.fromRGB(40, 25, 25)
    button.TextColor3 = Color3.new(1, 1, 1)
    button.Text = text
    button.TextSize = 15
    button.Font = Enum.Font.GothamSemibold
    button.Parent = main

    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, 8)
    c.Parent = button

    return button
end

local toggle = makeButton("UI: ON", 55)
local demo = makeButton("DEMO BUTTON", 105)

local enabled = true

toggle.Activated:Connect(function()
    enabled = not enabled
    toggle.Text = enabled and "UI: ON" or "UI: OFF"
    stroke.Enabled = enabled
end)

demo.Activated:Connect(function()
    demo.Text = "BUTTON PRESSED!"
    task.delay(1, function()
        if demo.Parent then
            demo.Text = "DEMO BUTTON"
        end
    end)
end)

close.Activated:Connect(function()
    gui:Destroy()
end)
