local WHEEL_INDICES = {0, 1, 4, 5} -- DO NOT Touch unless you know what you're doing

-- @param vehicle (Entity) The vehicle entity to check
-- @return (int) The number of burst tires on the vehicle
local function countBurstTires(vehicle)
    local burstTireCount = 0

    for _, wheelIndex in ipairs(WHEEL_INDICES) do
        if IsVehicleTyreBurst(vehicle, wheelIndex, false) then
            burstTireCount = burstTireCount + 1
            if burstTireCount == #WHEEL_INDICES then
                break
            end
        end
    end

    return burstTireCount
end

-- @param vehicle (Entity) The vehicle entity to check
-- @param tyresFlat (int) Amount of tires flattened
-- @return (number) The speed to set for the vehicle 
local function getBurstSpeed(vehicle, tyresFlat)
    local speed = 0
    if Config.UsePercent then
        local configPercent = Config.tyresBurst[tyresFlat].percent or 100
        local percent = configPercent <= 0 and 0 or configPercent > 100 and 100 or configPercent

        local vehicleMaxSpeed = GetVehicleHandlingFloat(vehicle, "CHandlingData", "fInitialDriveMaxFlatVel")
        speed = vehicleMaxSpeed * (percent / 100)
    else
        local SpeedS = Config.tyresBurst[tyresFlat].speed or Config.defaultSpeed
        speed = Config.useMph and SpeedS * 0.44704 or SpeedS / 3.6
    end

    return speed
end

-- @param vehicle (Entity) The vehicle whose maximum speed will be set
-- @param speed (number) The speed to set for the vehicle
local function setSpeed(vehicle, speed)
    if speed == nil then return end
    SetVehicleMaxSpeed(vehicle, speed)
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(Config.RefreshTime * 1000)

        local playerPed = PlayerPedId()
        local vehicle = GetVehiclePedIsIn(playerPed, false)

        if vehicle ~= 0 then
            local tyresBurst = countBurstTires(vehicle)

            if tyresBurst > 0 then
                local speed = getBurstSpeed(vehicle, tyresBurst)
                setSpeed(vehicle, speed)
            else
                setSpeed(vehicle, 0.0)
            end
        end
    end
end)