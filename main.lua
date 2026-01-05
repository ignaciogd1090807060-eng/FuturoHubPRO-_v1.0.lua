
--================== SERVICIOS ==================
local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local PlayerGui = player:WaitForChild("PlayerGui")

--================== CONFIG ==================
local HACK_NAME = "FuturoHub PRO++"
local KEYS = {
    "FUTUROHUBPRO++-123",
    "DELTA-456",
    "HUB-789",
    "RAINBOW-000"
}

--================== KEY GUI ==================
local keyGui = Instance.new("ScreenGui")
keyGui.Name = "FuturoHubKey"
keyGui.ResetOnSpawn = false
keyGui.Parent = PlayerGui

local frame = Instance.new("Frame", keyGui)
frame.Size = UDim2.new(0, 320, 0, 200)
frame.Position = UDim2.new(0.5, -160, 0.5, -100)
frame.BackgroundColor3 = Color3.fromRGB(20,20,30)
Instance.new("UICorner", frame).CornerRadius = UDim.new(0,16)

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1,0,0,50)
title.Text = "🔐 "..HACK_NAME
title.TextScaled = true
title.Font = Enum.Font.GothamBold
title.TextColor3 = Color3.new(1,1,1)
title.BackgroundTransparency = 1

local box = Instance.new("TextBox", frame)
box.Size = UDim2.new(0.9,0,0,40)
box.Position = UDim2.new(0.05,0,0,60)
box.PlaceholderText = "Enter Key"
box.TextScaled = true
box.BackgroundColor3 = Color3.fromRGB(30,30,45)
box.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", box).CornerRadius = UDim.new(0,10)

local btn = Instance.new("TextButton", frame)
btn.Size = UDim2.new(0.9,0,0,40)
btn.Position = UDim2.new(0.05,0,0,115)
btn.Text = "VERIFY"
btn.TextScaled = true
btn.Font = Enum.Font.GothamBold
btn.BackgroundColor3 = Color3.fromRGB(0,170,255)
btn.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", btn).CornerRadius = UDim.new(0,10)

local function validKey(k)
    k = k:upper()
    for _,v in pairs(KEYS) do
        if k == v then return true end
    end
    return false
end

btn.MouseButton1Click:Connect(function()
    if validKey(box.Text) then
        keyGui:Destroy()
    else
        btn.Text = "WRONG KEY"
        task.wait(1)
        btn.Text = "VERIFY"
    end
end)

--================== UI PRINCIPAL ==================
local gui = Instance.new("ScreenGui")
gui.Name = "FuturoHubUI"
gui.ResetOnSpawn = false
gui.Parent = PlayerGui

local panel = Instance.new("Frame", gui)
panel.Size = UDim2.new(0, 360, 0, 220)
panel.Position = UDim2.new(0.5, -180, 0.15, 0)
panel.BackgroundColor3 = Color3.fromRGB(20,20,30)
Instance.new("UICorner", panel).CornerRadius = UDim.new(0,16)

local label = Instance.new("TextLabel", panel)
label.Size = UDim2.new(1,0,0,50)
label.Text = HACK_NAME
label.TextScaled = true
label.Font = Enum.Font.GothamBold
label.TextColor3 = Color3.fromRGB(0,170,255)
label.BackgroundTransparency = 1

local function makeBtn(text,y)
    local b = Instance.new("TextButton", panel)
    b.Size = UDim2.new(0.9,0,0,40)
    b.Position = UDim2.new(0.05,0,0,y)
    b.Text = text
    b.TextScaled = true
    b.Font = Enum.Font.GothamBold
    b.BackgroundColor3 = Color3.fromRGB(30,30,45)
    b.TextColor3 = Color3.new(1,1,1)
    Instance.new("UICorner", b).CornerRadius = UDim.new(0,12)
    return b
end

local speedBtn = makeBtn("⚡ SPEED", 60)
local jumpBtn  = makeBtn("🦘 JUMP", 110)

local char = player.Character or player.CharacterAdded:Wait()
local hum = char:WaitForChild("Humanoid")

speedBtn.MouseButton1Click:Connect(function()
    hum.WalkSpeed = hum.WalkSpeed == 16 and 50 or 16
end)

jumpBtn.MouseButton1Click:Connect(function()
    hum.JumpPower = hum.JumpPower == 50 and 150 or 50
end)
