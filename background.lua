Background = {}

function Background:load()
    self.display = love.graphics.newImage("Assets/background.png")
end

function Background:update(dt)

end

function Background:draw()
    love.graphics.draw(self.display, 0, 0)
end