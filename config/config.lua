Config = {}

-- General Settings
Config.RefreshTime = 0.5          -- Refresh time between checks (in seconds)
Config.UsePercent = false         -- Use percentage of max speed instead of absolute speed
Config.defaultSpeed = 20          -- Default speed if no index is found
Config.useMph = false             -- If true, MPH will be used; if false, KM/H will be used

-- Speed Settings (based on burst tires count)
Config.tyresBurst = {
    -- If `UsePercent` is true, the percentage is used; otherwise, absolute speed is used.
    [1] = {percent = 80, speed = 80},   -- 1 tire burst
    [2] = {percent = 60, speed = 60},   -- 2 tires burst
    [3] = {percent = 40, speed = 40},   -- 3 tires burst
    [4] = {percent = 20, speed = 20},   -- 4 tires burst
}