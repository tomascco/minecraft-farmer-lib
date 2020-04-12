f=require("farmer")

f.up()

for i=1,17 do
  for i=1,18 do f.step() end
  f.turnSide()
end
for i=1,18 do f.step() end

f.down()
f.turnRight()
for i=1,16 do f.forward() end
f.turnLeft()
f.emptyInventory()
f.turnRight()
f.forward()
f.turnRight()
f.select(1)
f.changeFacing(true)