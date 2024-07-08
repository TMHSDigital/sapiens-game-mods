local mod = {
    loadOrder = 1
}

function mod:onload(character)
    local config = mjrequire "config"  -- Load the configuration
    local originalMoveTo = character.moveTo

    character.moveTo = function(self, destination, speed, ...)
        if speed then
            speed = speed * config.speedMultiplier  -- Use configurable speed multiplier
        end

        -- Add visual effect (this is a placeholder; actual implementation depends on the game's capabilities)
        self:addVisualEffect("speedTrail")

        return originalMoveTo(self, destination, speed, ...)
    end
end

return mod
