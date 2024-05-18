local Players = game.Players
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local Camera = workspace.CurrentCamera

local function getClosestToCursor()
    local Range = math.huge
    local Target = nil
    local allPlayers = Players:GetPlayers()
    
    for _, player in ipairs(allPlayers) do
        if player ~= LocalPlayer and player.Character and player.Character.PrimaryPart then
            local position, visible = Camera:WorldToScreenPoint(player.Character.PrimaryPart.Position)
            
            if visible then
                local distance = (Vector2.new(position.X, position.Y) - Vector2.new(Mouse.X, Mouse.Y)).Magnitude
                
                if distance <= Range then
                    Range = distance
                    Target = player
                end
            end
        end
    end
    
    return Target
end

return getClosestToCursor
