local players = game:GetService("Players")

local function getOwner(player)
    print(player.UserId)
end

players.PlayerAdded:Connect(getOwner)
