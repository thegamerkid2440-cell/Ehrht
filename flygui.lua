-- Delta Executor - Fly & Speed GUI Script
-- Made for educational purposes

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

-- GUI Setup
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "DeltaHackGUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = game:GetService("CoreGui")

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 300, 0, 400)
MainFrame.Position = UDim2.new(0.5, -150, 0.5, -200)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

-- Corner Radius
local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = MainFrame

-- Title
local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Size = UDim2.new(1, 0, 0, 40)
Title.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Title.Text = "⚡ Delta Executor - Hacks ⚡"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 18
Title.Font = Enum.Font.GothamBold
Title.Parent = MainFrame

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 10)
TitleCorner.Parent = Title

-- Fly Section
local FlyLabel = Instance.new("TextLabel")
FlyLabel.Size = UDim2.new(0.9, 0, 0, 30)
FlyLabel.Position = UDim2.new(0.05, 0, 0.15, 0)
FlyLabel.BackgroundTransparency = 1
FlyLabel.Text = "🚀 FLY CONTROLS"
FlyLabel.TextColor3 = Color3.fromRGB(0, 255, 255)
FlyLabel.TextSize = 16
FlyLabel.Font = Enum.Font.GothamBold
FlyLabel.Parent = MainFrame

-- Fly Toggle Button
local FlyButton = Instance.new("TextButton")
FlyButton.Name = "FlyButton"
FlyButton.Size = UDim2.new(0.9, 0, 0, 45)
FlyButton.Position = UDim2.new(0.05, 0, 0.25, 0)
FlyButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
FlyButton.Text = "FLY: OFF"
FlyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
FlyButton.TextSize = 16
FlyButton.Font = Enum.Font.GothamBold
FlyButton.Parent = MainFrame

local FlyButtonCorner = Instance.new("UICorner")
FlyButtonCorner.CornerRadius = UDim.new(0, 8)
FlyButtonCorner.Parent = FlyButton

-- Speed Input Frame
local SpeedFrame = Instance.new("Frame")
SpeedFrame.Size = UDim2.new(0.9, 0, 0, 50)
SpeedFrame.Position = UDim2.new(0.05, 0, 0.4, 0)
SpeedFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
SpeedFrame.Parent = MainFrame

local SpeedFrameCorner = Instance.new("UICorner")
SpeedFrameCorner.CornerRadius = UDim.new(0, 8)
SpeedFrameCorner.Parent = SpeedFrame

-- Speed Label
local SpeedLabel = Instance.new("TextLabel")
SpeedLabel.Size = UDim2.new(0.4, 0, 1, 0)
SpeedLabel.BackgroundTransparency = 1
SpeedLabel.Text = "Fly Speed:"
SpeedLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
SpeedLabel.TextSize = 14
SpeedLabel.Font = Enum.Font.Gotham
SpeedLabel.Parent = SpeedFrame

-- Speed Input Box
local SpeedInput = Instance.new("TextBox")
SpeedInput.Name = "SpeedInput"
SpeedInput.Size = UDim2.new(0.35, 0, 0.7, 0)
SpeedInput.Position = UDim2.new(0.42, 0, 0.15, 0)
SpeedInput.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
SpeedInput.Text = "100"
SpeedInput.PlaceholderText = "Speed"
SpeedInput.TextColor3 = Color3.fromRGB(255, 255, 255)
SpeedInput.TextSize = 14
SpeedInput.Font = Enum.Font.Gotham
SpeedInput.ClearTextOnFocus = false
SpeedInput.Parent = SpeedFrame

local SpeedInputCorner = Instance.new("UICorner")
SpeedInputCorner.CornerRadius = UDim.new(0, 6)
SpeedInputCorner.Parent = SpeedInput

-- OK Button
local OKButton = Instance.new("TextButton")
OKButton.Name = "OKButton"
OKButton.Size = UDim2.new(0.18, 0, 0.7, 0)
OKButton.Position = UDim2.new(0.79, 0, 0.15, 0)
OKButton.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
OKButton.Text = "OK"
OKButton.TextColor3 = Color3.fromRGB(255, 255, 255)
OKButton.TextSize = 14
OKButton.Font = Enum.Font.GothamBold
OKButton.Parent = SpeedFrame

local OKButtonCorner = Instance.new("UICorner")
OKButtonCorner.CornerRadius = UDim.new(0, 6)
OKButtonCorner.Parent = OKButton

-- Walk Speed Section
local WalkLabel = Instance.new("TextLabel")
WalkLabel.Size = UDim2.new(0.9, 0, 0, 30)
WalkLabel.Position = UDim2.new(0.05, 0, 0.58, 0)
WalkLabel.BackgroundTransparency = 1
WalkLabel.Text = "🏃 WALK SPEED"
WalkLabel.TextColor3 = Color3.fromRGB(255, 255, 0)
WalkLabel.TextSize = 16
WalkLabel.Font = Enum.Font.GothamBold
WalkLabel.Parent = MainFrame

-- Walk Speed Input Frame
local WalkFrame = Instance.new("Frame")
WalkFrame.Size = UDim2.new(0.9, 0, 0, 50)
WalkFrame.Position = UDim2.new(0.05, 0, 0.68, 0)
WalkFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
WalkFrame.Parent = MainFrame

local WalkFrameCorner = Instance.new("UICorner")
WalkFrameCorner.CornerRadius = UDim.new(0, 8)
WalkFrameCorner.Parent = WalkFrame

-- Walk Speed Label
local WalkSpeedLabel = Instance.new("TextLabel")
WalkSpeedLabel.Size = UDim2.new(0.4, 0, 1, 0)
WalkSpeedLabel.BackgroundTransparency = 1
WalkSpeedLabel.Text = "Walk Speed:"
WalkSpeedLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
WalkSpeedLabel.TextSize = 14
WalkSpeedLabel.Font = Enum.Font.Gotham
WalkSpeedLabel.Parent = WalkFrame

-- Walk Speed Input
local WalkInput = Instance.new("TextBox")
WalkInput.Size = UDim2.new(0.35, 0, 0.7, 0)
WalkInput.Position = UDim2.new(0.42, 0, 0.15, 0)
WalkInput.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
WalkInput.Text = "16"
WalkInput.PlaceholderText = "Speed"
WalkInput.TextColor3 = Color3.fromRGB(255, 255, 255)
WalkInput.TextSize = 14
WalkInput.Font = Enum.Font.Gotham
WalkInput.ClearTextOnFocus = false
WalkInput.Parent = WalkFrame

local WalkInputCorner = Instance.new("UICorner")
WalkInputCorner.CornerRadius = UDim.new(0, 6)
WalkInputCorner.Parent = WalkInput

-- Walk OK Button
local WalkOKButton = Instance.new("TextButton")
WalkOKButton.Size = UDim2.new(0.18, 0, 0.7, 0)
WalkOKButton.Position = UDim2.new(0.79, 0, 0.15, 0)
WalkOKButton.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
WalkOKButton.Text = "OK"
WalkOKButton.TextColor3 = Color3.fromRGB(255, 255, 255)
WalkOKButton.TextSize = 14
WalkOKButton.Font = Enum.Font.GothamBold
WalkOKButton.Parent = WalkFrame

local WalkOKCorner = Instance.new("UICorner")
WalkOKCorner.CornerRadius = UDim.new(0, 6)
WalkOKCorner.Parent = WalkOKButton

-- Status Label
local StatusLabel = Instance.new("TextLabel")
StatusLabel.Size = UDim2.new(0.9, 0, 0, 25)
StatusLabel.Position = UDim2.new(0.05, 0, 0.88, 0)
StatusLabel.BackgroundTransparency = 1
StatusLabel.Text = "Status: Ready"
StatusLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
StatusLabel.TextSize = 12
StatusLabel.Font = Enum.Font.Gotham
StatusLabel.Parent = MainFrame

-- Close Button
local CloseButton = Instance.new("TextButton")
CloseButton.Size = UDim2.new(0, 30, 0, 30)
CloseButton.Position = UDim2.new(1, -35, 0, 5)
CloseButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.TextSize = 16
CloseButton.Font = Enum.Font.GothamBold
CloseButton.Parent = MainFrame

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 6)
CloseCorner.Parent = CloseButton

-- Fly Variables
local flying = false
local flySpeed = 100
local flyConnection = nil
local flyBodyVelocity = nil
local flyBodyGyro = nil

-- Fly Function
local function toggleFly()
    flying = not flying
    
    if flying then
        FlyButton.Text = "FLY: ON"
        FlyButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
        StatusLabel.Text = "Status: Flying enabled"
        StatusLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
        
        -- Create fly physics
        flyBodyGyro = Instance.new("BodyGyro")
        flyBodyGyro.P = 9e4
        flyBodyGyro.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
        flyBodyGyro.CFrame = humanoidRootPart.CFrame
        flyBodyGyro.Parent = humanoidRootPart
        
        flyBodyVelocity = Instance.new("BodyVelocity")
        flyBodyVelocity.Velocity = Vector3.new(0, 0, 0)
        flyBodyVelocity.MaxForce = Vector3.new(9e9, 9e9, 9e9)
        flyBodyVelocity.Parent = humanoidRootPart
        
        -- Fly loop
        flyConnection = RunService.RenderStepped:Connect(function()
            if not flying then return end
            
            local camera = workspace.CurrentCamera
            local moveDirection = Vector3.new(0, 0, 0)
            
            if UserInputService:IsKeyDown(Enum.KeyCode.W) then
                moveDirection = moveDirection + camera.CFrame.LookVector
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.S) then
                moveDirection = moveDirection - camera.CFrame.LookVector
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.A) then
                moveDirection = moveDirection - camera.CFrame.RightVector
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.D) then
                moveDirection = moveDirection + camera.CFrame.RightVector
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
                moveDirection = moveDirection + Vector3.new(0, 1, 0)
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
                moveDirection = moveDirection - Vector3.new(0, 1, 0)
            end
            
            if moveDirection.Magnitude > 0 then
                moveDirection = moveDirection.Unit * flySpeed
            end
            
            flyBodyVelocity.Velocity = moveDirection
            flyBodyGyro.CFrame = camera.CFrame
        end)
    else
        FlyButton.Text = "FLY: OFF"
        FlyButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
        StatusLabel.Text = "Status: Flying disabled"
        StatusLabel.TextColor3 = Color3.fromRGB(255, 255, 0)
        
        if flyConnection then
            flyConnection:Disconnect()
            flyConnection = nil
        end
        if flyBodyVelocity then
            flyBodyVelocity:Destroy()
            flyBodyVelocity = nil
        end
        if flyBodyGyro then
            flyBodyGyro:Destroy()
            flyBodyGyro = nil
        end
    end
end

-- Set Fly Speed Function
local function setFlySpeed()
    local input = SpeedInput.Text
    local speed = tonumber(input)
    
    if speed then
        -- Clamp speed between 1 and 1,000,000
        speed = math.clamp(speed, 1, 1000000)
        flySpeed = speed
        StatusLabel.Text = "Fly speed set to: " .. tostring(speed)
        StatusLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
        
        -- Visual feedback
        local originalColor = OKButton.BackgroundColor3
        OKButton.BackgroundColor3 = Color3.fromRGB(0, 255, 100)
        wait(0.2)
        OKButton.BackgroundColor3 = originalColor
    else
        StatusLabel.Text = "Error: Invalid number!"
        StatusLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
    end
end

-- Set Walk Speed Function
local function setWalkSpeed()
    local input = WalkInput.Text
    local speed = tonumber(input)
    
    if speed then
        -- Clamp between 1 and 1000000
        speed = math.clamp(speed, 1, 1000000)
        humanoid.WalkSpeed = speed
        StatusLabel.Text = "Walk speed set to: " .. tostring(speed)
        StatusLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
        
        local originalColor = WalkOKButton.BackgroundColor3
        WalkOKButton.BackgroundColor3 = Color3.fromRGB(0, 255, 100)
        wait(0.2)
        WalkOKButton.BackgroundColor3 = originalColor
    else
        StatusLabel.Text = "Error: Invalid number!"
        StatusLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
    end
end

-- Button Connections
FlyButton.MouseButton1Click:Connect(toggleFly)
OKButton.MouseButton1Click:Connect(setFlySpeed)
WalkOKButton.MouseButton1Click:Connect(setWalkSpeed)

-- Close GUI
CloseButton.MouseButton1Click:Connect(function()
    if flying then
        toggleFly()
    end
    ScreenGui:Destroy()
end)

-- Enter key support for inputs
SpeedInput.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        setFlySpeed()
    end
end)

WalkInput.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        setWalkSpeed()
    end
end)

-- Character respawn handler
player.CharacterAdded:Connect(function(newChar)
    if flying then
        toggleFly()
    end
    character = newChar
    humanoid = newChar:WaitForChild("Humanoid")
    humanoidRootPart = newChar:WaitForChild("HumanoidRootPart")
end)

-- Notification
local Notification = Instance.new("TextLabel")
Notification.Size = UDim2.new(0, 250, 0, 50)
Notification.Position = UDim2.new(0.5, -125, 0, -60)
Notification.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
Notification.Text = "✅ Delta Script Loaded!\nPress F to toggle fly"
Notification.TextColor3 = Color3.fromRGB(255, 255, 255)
Notification.TextSize = 14
Notification.Font = Enum.Font.GothamBold
Notification.Parent = ScreenGui

local NotifCorner = Instance.new("UICorner")
NotifCorner.CornerRadius = UDim.new(0, 10)
NotifCorner.Parent = Notification

-- Animate notification
TweenService:Create(Notification, TweenInfo.new(0.5), {Position = UDim2.new(0.5, -125, 0, 20)}):Play()
wait(3)
TweenService:Create(Notification, TweenInfo.new(0.5), {Position = UDim2.new(0.5, -125, 0, -60)}):Play()
wait(0.5)
Notification:Destroy()

-- F key toggle
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if input.KeyCode == Enum.KeyCode.F and not gameProcessed then
        toggleFly()
    end
end)

print("Delta Executor Script Loaded Successfully!")
