import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"

local pd = playdate
local screenHeight = 240
local screenWidth = 400

local baseMoveSpeed = 100
local scaleSpeed = 8

local yPos = 65
local xPos = 20
local squareSize = 60
local maxSize = 150
local minSize = 10 + scaleSpeed

local moveSpeed = baseMoveSpeed / (squareSize)

--UPDATE
function playdate.update()
	pd.graphics.clear()
	
	--Movement
	if pd.buttonIsPressed(pd.kButtonUp) then 
		moveUp()
	end
	
	if pd.buttonIsPressed(pd.kButtonDown) then 
		moveDown()
	end
	
	if pd.buttonIsPressed(pd.kButtonLeft) then 
		moveLeft()
	end
	
	if pd.buttonIsPressed(pd.kButtonRight) then 
		moveRight()
	end
	
	--Scaling
	if pd.buttonIsPressed(pd.kButtonA) then 
		if squareSize > minSize then
			squareSize -= 1 * scaleSpeed
			xPos += scaleSpeed/2
			yPos += scaleSpeed/2
			moveSpeed = baseMoveSpeed / (squareSize)
		end
	end
	
	if pd.buttonIsPressed(pd.kButtonB) then 
		if squareSize < maxSize then
			squareSize += 1 * scaleSpeed
			xPos -= scaleSpeed/2
			yPos -= scaleSpeed/2
			moveSpeed = baseMoveSpeed / (squareSize)
		end
	end
	
	--Drawing
	pd.graphics.fillRect(xPos, yPos, squareSize, squareSize)
end


-- Player Controls
local movementControls = {
	upButtonDown = function()
		print("Up")
	end,
	
	downButtonDown = function() 
		print("Down")
	end,
	
	leftButtonDown = function() 
		print("Left")	
	end,
	
	rightButtonDown = function() 
		print("Right")
	end,
}

local scaleControls = {
	AButtonDown = function() 
		print("S")
	end,
	
	BButtonDown = function() 
		print("A")
	end,
}

pd.inputHandlers.push(movementControls)
pd.inputHandlers.push(scaleControls)

function moveUp()	
	if yPos > 0 then
		yPos -= 1 * moveSpeed
	end
end

function moveDown()	
	if yPos < (screenHeight - squareSize) then
		yPos += 1 * moveSpeed
	end
end

function moveLeft() 
	if xPos > 0 then 
		xPos -= 1 * moveSpeed
	end 
end     

function moveRight() 
	if xPos < (screenWidth - squareSize) then 
		xPos += 1 * moveSpeed
	end 
end     
	