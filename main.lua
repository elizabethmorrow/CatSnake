-- Liz
-- Test
-- Notes: Easy installation, cross-platform support

function love.load()
 -- loads all assets
   human = {}
   food = {}
   
   iscaught = false
   addbody = false
   numBodies = 1
   eaten =0
   width = love.graphics.getWidth()
   height = love.graphics.getHeight()
   
   food.x = 100
   food.y = 100
   --food.img = love.graphics.newImage("food.png")
   human.x = 300
   human.y = 200
   human.speed = 100
end
 
function love.update(dt)
 -- called every time frame is drawn
 
 if ((human.x <= food.x + 8) and (human.x >= food.x - 8)) and ((human.y <= food.y + 8) and (human.y >= food.y -8)) then
   food.x = love.math.random(width)
   food.y = love.math.random(height)
   addbody = true
   eaten = eaten +1
 end
 
 if love.keyboard.isDown("left") then
   move = human.x - human.speed*dt
   if move >=0 then
    human.x = move
   end
 elseif love.keyboard.isDown("right") then
   move = human.x + human.speed*dt
   if move <= width then
    human.x = move
   end
  elseif love.keyboard.isDown("up") then
    move = human.y - human.speed*dt
    if move >= 0 then
      human.y = move
    end
  elseif love.keyboard.isDown("down") then
    move = human.y + human.speed*dt
    if move <= height then
      human.y = move
    end
   end
end
 
function love.draw()

 -- cat human
 love.graphics.setColor(0,246,197)
 love.graphics.circle("fill", human.x,human.y, 30)
 --ears
 love.graphics.polygon("fill", human.x+27, human.y -16, human.x + 10,human.y-30, human.x+22,human.y-45)
 love.graphics.polygon("fill", human.x-27, human.y -16, human.x - 10,human.y-30, human.x-22,human.y-45)
 
 love.graphics.setColor(255,255,255)
 --eyes
 love.graphics.circle("fill", human.x+10,human.y-5, 5)
 love.graphics.circle("fill", human.x-10,human.y-5, 5)
 
 love.graphics.setColor(0,0,0)
 --eyes
 love.graphics.circle("fill", human.x+10,human.y-3, 3)
 love.graphics.circle("fill", human.x-10,human.y-3, 3)
 
  love.graphics.setColor(255,255,255)
 --nose
 love.graphics.polygon("fill", human.x+5,human.y+2,human.x -5,human.y+2,human.x,human.y+10)
 --ears
 love.graphics.polygon("fill", human.x+25, human.y -20, human.x + 10,human.y-30, human.x+20,human.y-40)
 love.graphics.polygon("fill", human.x-25, human.y -20, human.x - 10,human.y-30, human.x-20,human.y-40)
 --mouth
 love.graphics.line(human.x, human.y+7, human.x, human.y +15)
 love.graphics.line(human.x-5, human.y+16,human.x+5,human.y+16)

-- food 
 love.graphics.setColor(139,0,246)
 love.graphics.circle("fill", food.x,food.y,3)
 --love.graphics.draw(food.img, food.x,food.y)
 love.graphics.setColor(255,255,255)
 love.graphics.print("Bubbles Eaten: "..eaten, 20,20)

end