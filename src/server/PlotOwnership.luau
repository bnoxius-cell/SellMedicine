local module = {}

local players = game:GetService("Players")
local cs = game:GetService("CollectionService")
local ownerValue = cs:GetTagged("OwnerValue")

local function getOwner(player)
    if not player:IsA("Player") and not player and not player.UserId then 
        warn("Player is not valid or does not have a UserId.")
        return 
    end


end

function module.init()
    for i, player in ipairs(players:GetPlayers()) do
        -- Initialization logic for each player
    end
end


return module