# FiveM Burst Tires Speed Control

This is a simple **FiveM script** that dynamically adjusts the speed of a vehicle based on the number of burst tires. If the player is driving a vehicle with burst tires, the script will reduce the speed accordingly. It works by checking the number of burst tires and adjusting the speed either in percentage of the vehicle's max speed or with a fixed value, depending on the configuration.

## Features

- Adjust vehicle speed based on the number of burst tires.
- Configurable to either use **percentage of max speed** or a **fixed speed**.
- Fully configurable settings via `config.lua`.
- Works with both **MPH** and **KM/H**.

## Installation

1. **Download** or **clone** this repository into your `resources` folder of your FiveM server.
2. Add the following to your `server.cfg` file:
    ```
    start SpeedSetter
    ```

## Configuration

The script's behavior can be customized through the `config.lua` file. Below are the main configuration options available:

```lua
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
