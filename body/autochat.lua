local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterGui = game:GetService("StarterGui")
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer
local screenGui = Instance.new("ScreenGui")
local textLabel = Instance.new("TextLabel")
screenGui.Parent = player:WaitForChild("PlayerGui")
local settings = {
    AutoChat_Time = 120,
    AutoChat_Delay = 60,
    AutoChat = true,
}
local messages = {
    "Hello everyone!",
    "Good day all!",
    "pvp bro?",
    "haha",
    "wtf:)??",
    ":))",
    "=)))",
    "kb đi"
}
local chatrem = ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest


StarterGui:SetCore("SendNotification", {
    Title = "Auto Chat V2",
    Text = "Running by KayzDev-VN",
    Duration = 5,
})

textLabel.Size = UDim2.new(0, 400, 0, 50)
textLabel.Position = UDim2.new(0.5, -200, 0.5, -25)
textLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
textLabel.BackgroundTransparency = 0.5
textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
textLabel.TextScaled = true
textLabel.Text = "AutoChat By KayzDev-VN"
textLabel.Parent = screenGui

textLabel.TextTransparency = 1
local appearTween = TweenService:Create(textLabel, TweenInfo.new(2), {TextTransparency = 0})
appearTween:Play()
appearTween.Completed:Wait()

wait(5)

local disappearTween = TweenService:Create(textLabel, TweenInfo.new(2), {TextTransparency = 1}) -- Mờ dần trong 2 giây
disappearTween:Play()
disappearTween.Completed:Wait()

textLabel:Destroy()

while settings.AutoChat do
    local randomMessage = messages[math.random(1, #messages)]
    chatrem:FireServer(randomMessage, "All")
    
    task.wait(settings.AutoChat_Delay)
end