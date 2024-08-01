Player = {}
--add variables into Player table using self and .
function Player:load() -- colon symbol allows us to use self in the Player table
    --keeping track of the players position
    self.x = 50
    self.y = love.graphics.getHeight()/2 -- this function returns the height of the window
    --variables for players width and height
    self.width = 20
    self.height = 100
    -- setting speed of the player
    self.speed = 500
end

function Player:update(dt)
    self:move(dt)
    self:checkBoundaries()
end

function Player:move(dt)
    --movement of the player paddle
    if love.keyboard.isDown("w") then --function checks if a button is pressed
        self.y = self.y - self.speed * dt --in Love origin is top left thats why subtracting speed makes object go up
    elseif love.keyboard.isDown("s") then
        self.y = self.y + self.speed * dt
    end
end

function Player:checkBoundaries()
    --keeping the player paddle within the window
    if self.y < 0 then
        self.y = 0
    elseif self.y + self.height > love.graphics.getHeight() then
        self.y = love.graphics.getHeight() - self.height
    end
end

function Player:draw()
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height) --first parameter is for outline or filled shape
end