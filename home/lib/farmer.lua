local farmer = {}
local facingNorth = true
local SEEDSLOT = 16
local WHEATSLOT = 15

g = require("component").geolyzer
s = require("sides")
mt = {}
setmetatable(farmer, mt)
mt.__index = require("robot")

local function plantSeeds()
  if farmer.compareTo(SEEDSLOT) then
      farmer.placeDown()
  else
    local foundSeeds = false
    for i=1,14 do
      farmer.select(i)
      if farmer.compareTo(SEEDSLOT) then
        foundSeeds = true 
        farmer.placeDown()
        break
      end
    end
    if not foundSeeds then print("no seeds") end
  end 
end

function farmer.step()
  farmer.forward()
  local land = g.analyze(s.bottom)
  if land.name == "minecraft:wheat" then
    if land.growth == 1.0 then
      farmer.swingDown()
      farmer.suckDown()
      plantSeeds()
    end
  else
    plantSeeds()
  end
end

function farmer.turnSide()
  if facingNorth then
    farmer.turnRight()
    farmer.step()
    farmer.turnRight()
    facingNorth = false
  else
    farmer.turnLeft()
    farmer.step()
    farmer.turnLeft()
    facingNorth = true
  end
end

function farmer.emptyInventory()
  letSomeSeeds = true
  for i=1,14 do
    farmer.select(i)
    if letSomeSeeds and farmer.compareTo(SEEDSLOT) then
      letSomeSeeds = false
    else
      farmer.drop()
    end
  end
  for i=15,16 do
    farmer.select(i)
    farmer.drop(farmer.count() - 1)
  end
end

function farmer.changeFacing(face)
  facingNorth = face
end

return farmer