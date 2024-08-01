Ball = {} --create table to hold all variable and functions for the ball
--remember capital B because this is global variable

function Ball:load()
--initalize balls positions
    self.x = love.graphics.getWidth() / 2
    self.y = love.graphics.getHeight() / 2
    self.img = love.graphics.newImage("Assets/ball.png")
--balls dimensions and speed
    self.width = 40
    self.height = 40
    self.speed = 350
--balls direction is controlled by collision 
    self.xVelocity = -self.speed
    self.yVelocity = 0
end

function Ball:update(dt)
    self:move(dt)
    self:collision()
end

function Ball:collision()
    self:collideWall() 
    self:collisionPlayer()
    self:collisionAI()
    self:score()
end

function Ball:collideWall()
    if Ball.y < 0 then
        self.y = 0
        self.yVelocity = -self.yVelocity
    elseif self.y + self.height > love.graphics.getHeight() then 
        self.y = love.graphics.getHeight() - self.height
        self.yVelocity = -self.yVelocity
    end
end

function Ball:collisionPlayer()
    if isCollision(self, Player) then
        self.xVelocity = self.speed
        local middleBall = self.y + self.height / 2
        local middlePlayer = Player.y + Player.height / 2
        local collisionPosition = middleBall - middlePlayer
        self.yVelocity = collisionPosition * 5
    end
end

function Ball:collisionAI()
    if isCollision(self, AI) then
        self.xVelocity = -self.speed
        local middleBall = self.y + self.height / 2
        local middleAI = AI.y + AI.height / 2
        local collisionPosition = middleBall - middleAI
        self.yVelocity = collisionPosition * 5
    end
end

function Ball:score()
    if self.x < 0 then
        self:resetPosition(1)
    end

    if self.x + self.width >= love.graphics.getWidth() then
        self:resetPosition(-1)
    end
end

function Ball:resetPosition(modifier)
    if self.x < 0 then
        self.x = love.graphics.getWidth() / 2 - self.width / 2
        self.y = love.graphics.getHeight() / 2
        self.yVelocity = 0
        self.xVelocity = self.speed * modifier
    end
end


function Ball:move(dt)
    self.x = self.x + self.xVelocity * dt
    self.y = self.y + self.yVelocity * dt
end

function Ball:draw()
    love.graphics.draw(self.img, self.x, self.y)
end