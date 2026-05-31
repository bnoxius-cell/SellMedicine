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

    print("it works here bro idk what to tell you")
    for _, ownerValue in ipairs(ownerValues) do
        if not ownerValue.Value == 0 then return end
        ownerValue.Value = player.UserId
        player:SetAttribute("hasPlot", true)
        return
    end
end

function module.init()
    print("YES")
    players.PlayerAdded:Connect(setOwner)
    for _, player in ipairs(players:GetPlayers()) do
        print("Clean up")
        setOwner(player)
    end
end


return module