-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------
local tapCount = 0

-- loading the background:
local background = display.newImageRect("background.png", 360, 570)
-- centering the background:
background.x = display.contentCenterX
background.y = display.contentCenterY
-- adding tap counter with some formatting:
local tapText = display.newText(tapCount, display.contentCenterX, 20,
	native.systemFont, 40)
tapText:setFillColor(0, 0, 0)
-- loading the platform:
local platform = display.newImageRect("platform.png", 300, 50)
-- centering the platform:
platform.x = display.contentCenterX
platform.y = display.contentHeight-25
-- loading the balloon:
local balloon = display.newImageRect("balloon.png", 112, 112)
-- centering the balloon:
balloon.x = display.contentCenterX
balloon.y = display.contentCenterY
-- setting balloon opacity to 80%:
balloon.alpha = 0.8
-- adding physics module:
local physics = require("physics")
physics.start()
-- making platform a static physical body:
physics.addBody(platform, "static")
-- making balloon a dynamic physical body:
physics.addBody(balloon, "dynamic", { radius = 50, bounce = 0.3})
-- adding ability to push the balloon upwards only by 0.75 each time:
local function pushBalloon()
	balloon:applyLinearImpulse(0, -0.75, balloon.x, balloon.y)
	tapCount = tapCount + 1
	tapText.text = tapCount
end
-- adding event listener to balloon:
balloon:addEventListener("tap", pushBalloon)
