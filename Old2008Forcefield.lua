-- util
local Figure = script.Parent

local templateBox = Instance.new("SelectionBox")
templateBox.Visible = true
templateBox.Parent = script
templateBox.Name = "ForcefieldBox"

local Limbs = {
	"Head",
	"Torso",
	"Left Arm",
	"Right Arm",
	"Left Leg",
	"Right Leg",
}

function onSpawn()
	local boxes = {}
	for _, limbName in ipairs(Limbs) do
		local limb = Figure:FindFirstChild(limbName)
		if limb and limb:IsA("BasePart") then
			local box = templateBox:Clone()
			box.Adornee = limb
			box.Parent = limb
			table.insert(boxes, box)
		end
	end
	
	-- Color cycle: red -> purple -> blue -> purple -> (repeat)
	local colors = {
		Color3.new(1, 0, 0),     -- Red
		Color3.new(0.5, 0, 0.5), -- Purple
		Color3.new(0, 0, 1),     -- Blue
		Color3.new(0.5, 0, 0.5), -- Purple
	}
	
	local TweenService = game:GetService("TweenService")
	local FADE_TIME = 0.5
	
	task.spawn(function()
		local index = 1
		local elapsed = 0
		while elapsed < 10 do
			local nextIndex = index % #colors + 1
			local targetColor = colors[nextIndex]
			
			for _, box in boxes do
				local tween = TweenService:Create(box, TweenInfo.new(FADE_TIME), {Color3 = targetColor})
				tween:Play()
			end
			
			index = nextIndex
			task.wait(FADE_TIME)
			elapsed += FADE_TIME
		end
		for _, box in boxes do
			box:Destroy()
		end
	end)
end
onSpawn()
