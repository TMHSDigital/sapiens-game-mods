local mod = {
    loadOrder = 1
}

function mod:onload(character)
    local originalMoveTo = character.moveTo

    character.moveTo = function(self, destination, speed, ...)
        if speed then
            speed = speed * 5  -- Multiply the movement speed by 5
        end
        return originalMoveTo(self, destination, speed, ...)
    end
end

return mod
