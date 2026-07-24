-- QUICK MESSAGE: I created this click to move script. So that means the green circle
-- doesn't follow your mouse because idk how to do that

-- Also, there's no limit to where you place the green circle, so that also means
-- that you might just keep dying over and over again if there are no walls that
-- stop you from going to the void.

local player = game.Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")

local mouse = player:GetMouse()
local char = script.Parent or player.CharacterAdded:Wait()

local pos
local greenCircle

function createCircle()
	greenCircle = Instance.new("Part", workspace)
	greenCircle.Size = Vector3.new(0.25,3,3)
	greenCircle.Color = Color3.fromRGB(0, 255, 0)
	greenCircle.CanCollide = false
	greenCircle.Anchored = true
	greenCircle.Rotation = Vector3.new(0,0,90)
	greenCircle.Shape = Enum.PartType.Cylinder
end

function updateCircle()
	greenCircle.Transparency = 1
end
function leftClicked()
	pos = mouse.Hit.Position
	local humanoid = char:WaitForChild("Humanoid")
	
	if humanoid and humanoid.Parent then
		humanoid:MoveTo(pos)
		greenCircle.Position = pos
		greenCircle.Transparency = 0
		
		local connection
	end
end

-- all is Friend. Kill them. (millions of Roblox. Kill them. reference)

if UserInputService.MouseEnabled then
	createCircle()
end
mouse.Button1Down:Connect(leftClicked)
greenCircle.Touched:Connect(updateCircle)
