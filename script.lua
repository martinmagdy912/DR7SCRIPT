local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.ResetOnSpawn = false

-- الزر الرئيسي الدائري
local openBtn = Instance.new("TextButton")
openBtn.Name = "DR7Button"
openBtn.Parent = gui
openBtn.Text = "DR7"
openBtn.TextSize = 18
openBtn.Font = Enum.Font.GothamBlack
openBtn.Size = UDim2.new(0, 50, 0, 50)
openBtn.Position = UDim2.new(0, 10, 0.5, -25)
openBtn.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
openBtn.TextColor3 = Color3.new(1,1,1)
openBtn.BorderSizePixel = 0
openBtn.ZIndex = 10
openBtn.ClipsDescendants = true
openBtn.AutoButtonColor = true
openBtn.BackgroundTransparency = 0
openBtn.AnchorPoint = Vector2.new(0, 0.5)
openBtn.TextWrapped = true
openBtn.SizeConstraint = Enum.SizeConstraint.RelativeYY
openBtn.Shape = Enum.ButtonStyle.RobloxRoundButton

-- الفريم بتاع القايمة
local mainFrame = Instance.new("Frame")
mainFrame.Parent = gui
mainFrame.Size = UDim2.new(0, 300, 0, 300)
mainFrame.Position = UDim2.new(0, 70, 0.5, -150)
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
mainFrame.Visible = false

-- دالة التبديل
openBtn.MouseButton1Click:Connect(function()
	mainFrame.Visible = not mainFrame.Visible
end)

-- Tabs setup
local tabs = {"القتال", "السرقة", "بروكهافن", "أدوات التنقل"}
local tabScripts = {
	["القتال"] = {
		{"ESP", 'loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-ESP-5762"))()'},
		{"Aimbot", 'loadstring(game:HttpGet("https://rawscripts.net/raw/Aimbot-For-Roblox-4856"))()'},
	},
	["السرقة"] = {
		{"Infinite Yield", 'loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()'},
	},
	["بروكهافن"] = {
		{"Script 1", 'loadstring(game:HttpGet("https://raw.githubusercontent.com/martinmagdy912/Brookhaven/main/Script"))()'},
	},
	["أدوات التنقل"] = {
		{"Fly", 'loadstring(game:HttpGet("https://rawscripts.net/raw/Fly-GUI-3810"))()'},
		{"Fling", 'loadstring(game:HttpGet("https://rawscripts.net/raw/Fling-GUI-7129"))()'},
		{"Wallhop", 'loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-wallhop-42706"))()'},
	}
}

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Parent = mainFrame
UIListLayout.FillDirection = Enum.FillDirection.Vertical
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 5)

for _, tabName in ipairs(tabs) do
	local tabBtn = Instance.new("TextButton")
	tabBtn.Parent = mainFrame
	tabBtn.Size = UDim2.new(1, -10, 0, 30)
	tabBtn.Position = UDim2.new(0, 5, 0, 0)
	tabBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	tabBtn.Text = tabName
	tabBtn.TextColor3 = Color3.new(1,1,1)
	tabBtn.Font = Enum.Font.Gotham
	tabBtn.TextSize = 16

	tabBtn.MouseButton1Click:Connect(function()
		local options = tabScripts[tabName]
		for _, v in pairs(options) do
			local scriptName = v[1]
			local scriptCode = v[2]

			local sbtn = Instance.new("TextButton")
			sbtn.Parent = mainFrame
			sbtn.Size = UDim2.new(1, -20, 0, 25)
			sbtn.Position = UDim2.new(0, 10, 0, 0)
			sbtn.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
			sbtn.Text = " > " .. scriptName
			sbtn.TextColor3 = Color3.new(1,1,1)
			sbtn.Font = Enum.Font.Gotham
			sbtn.TextSize = 14
			sbtn.MouseButton1Click:Connect(function()
				loadstring(scriptCode)()
			end)
		end
	end)
end