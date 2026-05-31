local module = {}

local players = game:GetService("Players")
local cs = game:GetService("CollectionService")
local ownerValues = cs:GetTagged("OwnerValue")

local function setOwner(player)
    if not player and not player.UserId then
        warn("Player is not valid or does not have a UserId.")
        return
    end

    if player:GetAttribute("hasPlot") then return end

    if #ownerValues == 0 then
        warn("OwnerValue tag not found in CollectionService. Likely cause: player count exceeds 6.")
        return
    end

    for _, ownerValue in ipairs(ownerValues) do
        if not ownerValue.Value == 0 then return end
        ownerValue.Value = player.UserId
        player:SetAttribute("hasPlot", true)
        return
    end
end

local function removeOwner(player)
    local leavingId = player.UserId

    for _, ownerValue in ipairs(ownerValues) do
        if ownerValue.Value == leavingId then 
            ownerValue.Value = 0
            player:SetAttribute("hasPlot", false)
            return
        end
    end
end

function module.init()
    players.PlayerAdded:Connect(setOwner)

    players.PlayerRemoving:Connect(removeOwner)

    for _, player in ipairs(players:GetPlayers()) do
        setOwner(player)
    end
end


return module