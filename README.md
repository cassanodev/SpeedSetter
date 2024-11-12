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

-- Refresh time in seconds between each check for burst tires
Config.RefreshTime = 0.5

-- Use percentage of max speed instead of a fixed speed
Config.UsePercent = false

-- Default speed to be used if no tire burst index is found
Config.defaultSpeed = 20

-- Percent of max speed when different numbers of tires are flat
Config.tyresBurstPercent = {
    [1] = 80, -- 1 tire flat
    [2] = 60, -- 2 tires flat
    [3] = 40, -- 3 tires flat
    [4] = 20, -- 4 tires flat
}

-- Speed in KM/H or MPH when a specific number of tires are flat
Config.tyresBurstSet = {
    [1] = 80,  -- Speed for 1 tire flat
    [2] = 60,  -- Speed for 2 tires flat
    [3] = 40,  -- Speed for 3 tires flat
    [4] = 20,  -- Speed for 4 tires flat
}

-- Set whether to use MPH instead of KM/H (false for KM/H)
Config.useMph = false
