function love.load()
    anim8 = require 'libraries/anim8'
    player = {}
    player.x = 400
    player.y = 200
    player.speed = 5
    player.sprite = love.graphics.newImage('sprites/parrot.png')
    player.spriteSheet = love.graphics.newImage('sprites/human.png')
    player.grid = anim8.newGrid( 12, 18, player.human:getWidth(), player.human:getHeight() )
   
    player.animations = {}
    player.animations.down = anim8.newAnimation( player.grid('1-4', 1), 0.2 )
   
    background = love.graphics.newImage('sprites/background.png')
end

function love.update(dt)
    if love.keyboard.isDown("right") then
        player.x = player.x + player.speed
    end
    
    if love.keyboard.isDown("left") then
        player.x = player.x - player.speed
    end  

    if love.keyboard.isDown("down") then
        player.y = player.y + player.speed
    end  

    if love.keyboard.isDown("up") then
        player.y = player.y - player.speed
    end  

    player.animations.dowm:update(dt)
end

function love.draw()
    love.graphics.draw(background, 0, 0)
    love.graphics.draw(player.sprite, player.x, player.y)
    
end    
