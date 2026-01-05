# FuturoHubPRO-_v1.0.lua
v1.0 – First public release
--================== SERVICIOS ==================
local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local player = Players.LocalPlayer
local PlayerGui = player:WaitForChild("PlayerGui")

--================== HACK ==================
local HACK_NAME = "FuturoHubPRO++"
local KEYS = {HACK_NAME.."-123","DELTA-456","HUB-789","RAINBOW-000"}
local KEY_OK = false

local function connect(btn,func)
    btn.MouseButton1Click:Connect(func)
    btn.TouchTap:Connect(func)
end

--================== KEY GUI ==================
local keyGui = Instance.new("ScreenGui", PlayerGui)
keyGui.ResetOnSpawn=false
local kFrame = Instance.new("Frame", keyGui)
kFrame.Size = UDim2.new(0,400,0,240)
kFrame.Position = UDim2.new(0.5,-200,0.5,-120)
kFrame.BackgroundColor3 = Color3.fromRGB(20,20,30)
Instance.new("UICorner", kFrame).CornerRadius=UDim.new(0,16)

local kTitle = Instance.new("TextLabel", kFrame)
kTitle.Size = UDim2.new(1,0,0,60)
kTitle.Text = "🔐 "..HACK_NAME.." KEY"
kTitle.TextScaled = true
kTitle.Font = Enum.Font.GothamBold
kTitle.TextColor3 = Color3.new(1,1,1)
kTitle.BackgroundTransparency=1

local kBox = Instance.new("TextBox", kFrame)
kBox.Size=UDim2.new(0.9,0,0,50)
kBox.Position=UDim2.new(0.05,0,0,70)
kBox.PlaceholderText="Enter Key"
kBox.TextScaled=true
kBox.BackgroundColor3=Color3.fromRGB(30,30,45)
kBox.TextColor3=Color3.new(1,1,1)
Instance.new("UICorner", kBox).CornerRadius=UDim.new(0,10)

local kBtn = Instance.new("TextButton", kFrame)
kBtn.Size=UDim2.new(0.9,0,0,50)
kBtn.Position=UDim2.new(0.05,0,0,140)
kBtn.Text="VERIFY"
kBtn.TextScaled=true
kBtn.Font=Enum.Font.GothamBold
kBtn.BackgroundColor3=Color3.fromRGB(0,170,255)
kBtn.TextColor3=Color3.new(1,1,1)
Instance.new("UICorner", kBtn).CornerRadius=UDim.new(0,10)

connect(kBtn,function()
    local input = kBox.Text:upper()
    local ok=false
    for _,key in ipairs(KEYS) do
        if input==key then ok=true break end
    end
    if ok then
        KEY_OK=true
        keyGui:Destroy()
    else
        kBtn.Text="WRONG KEY"
        task.wait(1)
        kBtn.Text="VERIFY"
    end
end)
repeat task.wait() until KEY_OK

--================== PERSONAJE ==================
local char = player.Character or player.CharacterAdded:Wait()
local hum = char:WaitForChild("Humanoid")
local hrp = char:WaitForChild("HumanoidRootPart")
player.CharacterAdded:Connect(function(c)
    char=c
    hum=c:WaitForChild("Humanoid")
    hrp=c:WaitForChild("HumanoidRootPart")
end)

--================== PANEL ==================
local gui = Instance.new("ScreenGui", PlayerGui)
gui.ResetOnSpawn=false
local panel = Instance.new("Frame", gui)
panel.Size=UDim2.new(0,850,0,400)
panel.Position=UDim2.new(0.5,-425,0.1,0)
panel.BackgroundColor3=Color3.fromRGB(20,20,30)
Instance.new("UICorner", panel).CornerRadius=UDim.new(0,16)
local stroke = Instance.new("UIStroke", panel)
stroke.Thickness=3

local hackLabel = Instance.new("TextLabel", panel)
hackLabel.Size=UDim2.new(1,0,0,60)
hackLabel.Position=UDim2.new(0,0,0,0)
hackLabel.Text=HACK_NAME
hackLabel.TextScaled=true
hackLabel.Font=Enum.Font.GothamBold
hackLabel.TextColor3=Color3.fromRGB(0,170,255)
hackLabel.BackgroundTransparency=1

local reopen = Instance.new("TextButton", gui)
reopen.Size=UDim2.new(0,140,0,50)
reopen.Position=UDim2.new(0.05,0,0.5,0)
reopen.Text="⚡ OPEN"
reopen.Visible=false
reopen.Font=Enum.Font.GothamBold
reopen.TextScaled=true
reopen.BackgroundColor3=Color3.fromRGB(20,20,30)
reopen.TextColor3=Color3.new(1,1,1)
Instance.new("UICorner", reopen).CornerRadius=UDim.new(0,14)

local close = Instance.new("TextButton", panel)
close.Size = UDim2.new(0,40,0,40)
close.Position = UDim2.new(1,-45,0,5)
close.Text = "X"
close.TextScaled=true
close.Font=Enum.Font.GothamBold
close.BackgroundColor3 = Color3.fromRGB(170,0,0)
close.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", close).CornerRadius = UDim.new(0,10)

connect(close,function()
    panel.Visible=false
    reopen.Visible=true
end)
connect(reopen,function()
    panel.Visible=true
    reopen.Visible=false
end)

--================== BOTONES ==================
local function createBtn(text,x,y,colorOff,colorOn)
    local b=Instance.new("TextButton",panel)
    b.Size=UDim2.new(0,120,0,50)
    b.Position=UDim2.new(0,x,0,y)
    b.Text=text
    b.TextScaled=true
    b.Font=Enum.Font.GothamBold
    b.BackgroundColor3=colorOff
    b.TextColor3=Color3.new(1,1,1)
    Instance.new("UICorner",b).CornerRadius=UDim.new(0,14)
    return b,colorOff,colorOn
end

local gray=Color3.fromRGB(30,30,45)
local blue=Color3.fromRGB(0,170,255)
local green=Color3.fromRGB(0,255,0)
local red=Color3.fromRGB(255,0,0)
local purple=Color3.fromRGB(170,0,255)
local yellow=Color3.fromRGB(255,255,0)

-- Botones ON/OFF para todas las funciones
local speedBtn,sOff,sOn=createBtn("⚡ SPEED OFF",10,70,gray,blue)
local jumpBtn,jOff,jOn=createBtn("🦘 JUMP OFF",10,140,gray,green)
local espBtn,eOff,eOn=createBtn("👁 ESP OFF",10,210,gray,red)
local hitBtn,hOff,hOn=createBtn("📦 HITBOX OFF",150,210,gray,purple)
local gravBtn,gOff,gOn=createBtn("🪐 GRAV OFF",10,280,gray,yellow)
local invisBtn,iOff,iOn=createBtn("👻 INVIS OFF",150,280,gray,blue)

-- Sliders opcionales (solo para ajuste)
local speedLabel = Instance.new("TextLabel",panel)
speedLabel.Size=UDim2.new(0,80,0,40)
speedLabel.Position=UDim2.new(0,270,0,70)
speedLabel.Text="SPEED"
speedLabel.TextScaled=true
speedLabel.Font=Enum.Font.GothamBold
speedLabel.TextColor3=Color3.new(1,1,1)
speedLabel.BackgroundTransparency=1
local speedBox = Instance.new("TextBox",panel)
speedBox.Size=UDim2.new(0,80,0,40)
speedBox.Position=UDim2.new(0,360,0,70)
speedBox.Text="40"
speedBox.TextScaled=true
speedBox.Font=Enum.Font.GothamBold
speedBox.TextColor3=Color3.new(1,1,1)
speedBox.BackgroundColor3=Color3.fromRGB(30,30,45)
Instance.new("UICorner",speedBox).CornerRadius=UDim.new(0,12)

local jumpLabel = Instance.new("TextLabel",panel)
jumpLabel.Size=UDim2.new(0,80,0,40)
jumpLabel.Position=UDim2.new(0,270,0,140)
jumpLabel.Text="JUMP"
jumpLabel.TextScaled=true
jumpLabel.Font=Enum.Font.GothamBold
jumpLabel.TextColor3=Color3.new(1,1,1)
jumpLabel.BackgroundTransparency=1
local jumpBox = Instance.new("TextBox",panel)
jumpBox.Size=UDim2.new(0,80,0,40)
jumpBox.Position=UDim2.new(0,360,0,140)
jumpBox.Text="120"
jumpBox.TextScaled=true
jumpBox.Font=Enum.Font.GothamBold
jumpBox.TextColor3=Color3.new(1,1,1)
jumpBox.BackgroundColor3=Color3.fromRGB(30,30,45)
Instance.new("UICorner",jumpBox).CornerRadius=UDim.new(0,12)

--================== ESTADOS ==================
local speedOn,jumpOn,espOn,hitboxOn,gravOn,invisOn=false,false,false,false,false,false
local bodyForce

local function updateBtn(btn,state,textOn,textOff,colorOn,colorOff)
    if state then
        btn.Text=textOn
        btn.BackgroundColor3=colorOn
    else
        btn.Text=textOff
        btn.BackgroundColor3=colorOff
    end
end

--================== FUNCIONES BOTONES ==================
connect(speedBtn,function()
    speedOn = not speedOn
    if speedOn then hum.WalkSpeed = 50 else hum.WalkSpeed = 16 end -- modo rápido
    updateBtn(speedBtn,speedOn,"⚡ SPEED ON","⚡ SPEED OFF",sOn,sOff)
end)
connect(jumpBtn,function()
    jumpOn = not jumpOn
    if jumpOn then hum.JumpPower = 150 else hum.JumpPower = 50 end -- modo rápido
    updateBtn(jumpBtn,jumpOn,"🦘 JUMP ON","🦘 JUMP OFF",jOn,jOff)
end)
connect(espBtn,function() espOn = not espOn updateBtn(espBtn,espOn,"👁 ESP ON","👁 ESP OFF",eOn,eOff) end)
connect(hitBtn,function() hitboxOn = not hitboxOn updateBtn(hitBtn,hitboxOn,"📦 HITBOX ON","📦 HITBOX OFF",hOn,hOff) end)
connect(gravBtn,function()
    gravOn = not gravOn
    if gravOn then bodyForce=Instance.new("BodyForce",hrp) bodyForce.Force=Vector3.new(0,hrp.AssemblyMass*Workspace.Gravity,0)
    else if bodyForce then bodyForce:Destroy() end
    end
    updateBtn(gravBtn,gravOn,"🪐 GRAV ON","🪐 GRAV OFF",gOn,gOff)
end)
connect(invisBtn,function()
    invisOn = not invisOn
    for _,part in pairs(char:GetDescendants()) do
        if part:IsA("BasePart") then
            part.Transparency = invisOn and 0.3 or 0
        end
    end
    updateBtn(invisBtn,invisOn,"👻 INVIS ON","👻 INVIS OFF",iOn,iOff)
end)

--================== UPDATE SLIDERS ==================
RunService.RenderStepped:Connect(function()
    if speedOn then local s=tonumber(speedBox.Text) if s then hum.WalkSpeed=s end end
    if jumpOn then local j=tonumber(jumpBox.Text) if j then hum.JumpPower=j end end
end)

--================== ESP + HITBOX ==================
RunService.RenderStepped:Connect(function()
    for _,p in pairs(Players:GetPlayers()) do
        if p~=player and p.Character then
            local head = p.Character:FindFirstChild("Head")
            local root = p.Character:FindFirstChild("HumanoidRootPart")
            if espOn and head then
                if not head:FindFirstChild("ESP") then
                    local b=Instance.new("BillboardGui")
                    b.Name="ESP"
                    b.Size=UDim2.new(0,120,0,50)
                    b.Adornee=head
                    b.AlwaysOnTop=true
                    b.Parent=head
                    local t=Instance.new("TextLabel",b)
                    t.Size=UDim2.new(1,0,1,0)
                    t.BackgroundTransparency=1
                    t.TextColor3=Color3.new(1,0,0)
                    t.TextScaled=true
                    t.Text=p.Name
                end
            elseif head and head:FindFirstChild("ESP") then
                head.ESP:Destroy()
            end
            if hitboxOn and root then
                if not root:FindFirstChild("HITBOX") then
                    local h=Instance.new("BoxHandleAdornment")
                    h.Name="HITBOX"
                    h.Adornee=root
                    h.Size=Vector3.new(6,8,6)
                    h.Color3=Color3.new(1,0,0)
                    h.Transparency=0.5
                    h.AlwaysOnTop=true
                    h.Parent=root
                end
            elseif root and root:FindFirstChild("HITBOX") then
                root.HITBOX:Destroy()
            end
        end
    end
end)

--================== DRAG ==================
local dragging,startPos,startUI
panel.InputBegan:Connect(function(i)
    if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then
        dragging=true
        startPos=i.Position
        startUI=panel.Position
    end
end)
UIS.InputChanged:Connect(function(i)
    if dragging and (i.UserInputType==Enum.UserInputType.MouseMovement or i.UserInputType==Enum.UserInputType.Touch) then
        local d=i.Position-startPos
        panel.Position=UDim2.new(startUI.X.Scale,startUI.X.Offset+d.X,startUI.Y.Scale,startUI.Y.Offset+d.Y)
    end
end)
UIS.InputEnded:Connect(function() dragging=false end)

--================== RAINBOW ==================
local h=0
RunService.RenderStepped:Connect(function()
    h=(h+1)%360
    stroke.Color=Color3.fromHSV(h/360,1,1)
end)
