local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")

local specialPlayers = {"rip_indra", "uzoth", "mygame43"}

local function isSpecialPlayer(name)
    local lowerName = string.lower(name)
    for _, value in ipairs(specialPlayers) do
        if value == lowerName then
            return true
        end
    end
    return false
end
Players.PlayerAdded:Connect(function(player)
    if isSpecialPlayer(player.Name) then
        local success, result = pcall(function()
            TeleportService:Teleport(game.PlaceId, player)
        end)

        if not success then
            warn("Lỗi khi chuyển server: " .. tostring(result))
        end
    end
end)