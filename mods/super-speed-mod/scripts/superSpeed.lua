local mod = {
    loadOrder = 1
}

function mod:onload(game)
    local config = mjrequire "config"  -- Load the configuration
    
    local originalUpdate = game.update

    game.update = function(self, dt)
        originalUpdate(self, dt)
        
        local tribe = mjrequire "common/tribe"
        local tribes = tribe.tribes
        
        for _, sapien in ipairs(self.world.characters) do
            if tribes[sapien.tribeID] and sapien.movement then
                sapien.movement.speed = sapien.movement.speed * config.speedMultiplier
            end
        end
    end
end

return mod
