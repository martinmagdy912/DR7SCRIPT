--[[
   سكربت واجهة DR7
   تصميم مخصص بالمربعات والتابات
   إعداد: MARTIN
]]--

-- تحميل Rayfield UI
local Rayfield = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Rayfield/main/source"))()

-- إنشاء نافذة
local Window = Rayfield:CreateWindow({
   Name = "DR7",
   LoadingTitle = "DR7 Interface",
   LoadingSubtitle = "by MARTIN",
   ConfigurationSaving = {
      Enabled = false
   },
   Discord = {
      Enabled = false
   },
   KeySystem = false
})

--[[
    تبويب القتال
]]--
local combatTab = Window:CreateTab("🗡️ القتال", 4483362458)

combatTab:CreateButton({
   Name = "murder vs sheriff duel",
   Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/tbao143/thaibao/main/TbaoHubMurdervssheriff"))()
   end
})

combatTab:CreateButton({
   Name = "mm2",
   Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Au0yX/Community/main/XhubMM2"))()
   end
})

--[[
    تبويب بروكهافن
]]--
local brookTab = Window:CreateTab("🏡 بروكهافن", 4483362458)

brookTab:CreateButton({
   Name = "مارتن",
   Callback = function()
      loadstring(game:HttpGet("https://rawscripts.net/raw/Brookhaven-RP-MARTIN-IRAQ-31476"))()
   end
})

brookTab:CreateButton({
   Name = "الفا",
   Callback = function()
      loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-ALFA-IRAQ-34036"))()
   end
})

brookTab:CreateButton({
   Name = "خليفه",
   Callback = function()
      loadstring(game:HttpGet("https://rawscripts.net/raw/Brookhaven-RP-MS13-IRAQ-44980"))()
   end
})

--[[
    تبويب ماب السرقه
]]--
local robberyTab = Window:CreateTab("💰 ماب السرقه", 4483362458)

robberyTab:CreateButton({
   Name = "ماب السرقه",
   Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/DoliScriptz/loader/refs/heads/main/main.lua",true))()
   end
})

robberyTab:CreateButton({
   Name = "ماب السرقه 2",
   Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/tienkhanh1/spicy/main/Chilli.lua"))()
   end
})

--[[
    تبويب أخرى
]]--
local otherTab = Window:CreateTab("🎮 أخرى", 4483362458)

otherTab:CreateButton({
   Name = "طيران",
   Callback = function()
      loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-FE-FLY-MOBILE-SCRIPT-23875"))()
   end
})

otherTab:CreateButton({
   Name = "فلينق",
   Callback = function()
      loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Touch-fling-41998"))()
   end
})

otherTab:CreateButton({
   Name = "وول هوب",
   Callback = function()
      loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-wallhop-42706"))()
   end
})

otherTab:CreateButton({
   Name = "رقصات مجانية",
   Callback = function()
      loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Fe-emotes-15813"))()
   end
})

--[[
    زر فتح/إغلاق الواجهة
]]--
local ToggleUI = Instance.new("TextButton")
ToggleUI.Text = "DR7"
ToggleUI.Size = UDim2.new(0, 60, 0, 60)
ToggleUI.Position = UDim2.new(0, 20, 0.5, -30)
ToggleUI.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
ToggleUI.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleUI.TextScaled = true
ToggleUI.Font = Enum.Font.GothamBold
ToggleUI.Parent = game.CoreGui
ToggleUI.ZIndex = 9999

ToggleUI.MouseButton1Click:Connect(function()
   Window:Toggle()
end)