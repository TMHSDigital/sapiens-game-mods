local mod = {
    loadOrder = 1
}

function mod:onload(character)
    local originalUpdate = character.update

    character.update = function(self, dt)
        originalUpdate(self, dt)
        
        -- Increase the character's movement speed
        if self.movement and self.movement.speed then
            self.movement.speed = self.movement.speed * 5
        end
    end
end

return mod
