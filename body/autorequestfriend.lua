local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local sentRequests = {}

local function sendFriendRequests()
    
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            local userId = player.UserId
            local isFriend = LocalPlayer:IsFriendsWith(userId)
            
            if not isFriend and not sentRequests[userId] then
                local success, err = pcall(function()
                    LocalPlayer:RequestFriendship(player)
                end)
                
                if success then
                    sentRequests[userId] = true
                else
                    warn("Không thể gửi lời mời cho " .. player.Name .. ". Lỗi: " .. tostring(err))
                end
            end
        end
    end
end

task.spawn(function()
    while true do
        sendFriendRequests()
        task.wait(120) 
    end
end)