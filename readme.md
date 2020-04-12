# Minecraft Farmer lib

This library implements farming utilities in computers running OpenOS, the operating system from OpenComputers Minecraft Mod.

The code is in its first version and only supports plantations like wheat, carrots, etc.

## Required computer components

To run this library you will need a robot with a geolyzer.

## Structure

The implementation itself is located at `/home/lib/farmer.lua`, thus being in a lookup location of the OS. It extends the Robot API by setting it as metatable from the `farmer` table.

A example scripts is in `/home/routine` and an autorun to be run when the computer starts is located at `/autorun.lua`.

## Assumptions

- The farming plot is a rectangle
- It's a wheat plantation
- It runs with seeds in slot 16 and wheat in slot 15 for comparation purposes

## Methods

### local farmer.plantSeeds()

Search for seeds starting in the robot's inventory, by comparing the current item with the `SEEDSLOT`. If it doesn't find any, it prints "no seeds to stdout".

### farmer.step()

Takes a step forward and then check if the current crop is fully grown. If it is, the crop is collected and a new seeds are planted. If the crop is not fully grown, it's ignored. If there's no crop, seeds are planted.

### farmer.turnSide()

Assuming a rectangular plot, when the border is reached, this method is used to make the robot turn sides, based on a local variable named `facingNorth`, that keep track to which direction the robot should turn.

### farmer.emptyInventory

Empties the robot's inventory, keeping one item in the slots 15, 16.

### farmer.changeFacing

Setter method to modify `facingNorth` variable.

## External links

OpenComputers docs: https://ocdoc.cil.li/
Robot API: https://ocdoc.cil.li/component:robot
Geolyzer API: https://ocdoc.cil.li/component:geolyzer

## Contributions

This is a personal and very go horse project, but if you are a Minecraft and programming enthusiast, feel free to contribute.

