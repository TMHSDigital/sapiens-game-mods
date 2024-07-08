local mod = {
    loadOrder = 1
}

function mod:onload(world)
    local config = mjrequire "config"  -- Load the configuration
    local nightStart = 0.5  -- Start of night (in game time)
    local nightEnd = 0.75   -- End of night (in game time)
    local realTimeDuration = config.nightDurationInSeconds
    local gameSecondsInADay = 86400  -- Total game seconds in a day (24 hours * 60 minutes * 60 seconds)

    local function adjustNightDuration(time)
        if time >= nightStart and time <= nightEnd then
            local nightDuration = (nightEnd - nightStart) * gameSecondsInADay
            local realTimeRatio = realTimeDuration / nightDuration
            world.timeScale = realTimeRatio  -- Adjust the time scale to match real time duration
        else
            world.timeScale = 1  -- Normal time scale during the day
        end
    end

    local originalSetTime = world.setTime
    world.setTime = function(time)
        adjustNightDuration(time)
        originalSetTime(time)
    end
end

return mod
