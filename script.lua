-- واجهة GUI كاملة فيها زر Toggle وTabs وسكربتات، وتبدأ مفتوحة

local player = game.Players.LocalPlayer
local mouse = player:GetMouse()

local screenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
screenGui.ResetOnSpawn = false
screenGui.Name = "DR7_GUI"

-- زرار التفعيل
local toggleBtn = Instance.new("TextButton", screenGui)
toggleBtn.Size = UDim2.new(0, 70, 0, 70)
toggleBtn.Position = UDim2.new(0, 10, 0.5, -35)
toggleBtn.Text = "DR7"
toggleBtn.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
toggleBtn.TextColor3 = Color3.new(1, 1, 1)
toggleBtn.Font = Enum.Font.GothamBold
toggleBtn.TextSize = 24
toggleBtn.BackgroundTransparency = 0.2
Instance.new("UICorner", toggleBtn).CornerRadius = UDim.new(1, 0)

-- الواجهة الرئيسية
local mainFrame = Instance.new("Frame", screenGui)
mainFrame.Size = UDim2.new(0, 520, 0, 320)
mainFrame.Position = UDim2.new(0.5, -260, 0.5, -160)
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
mainFrame.BorderSizePixel = 0
mainFrame.Visible = true -- تبدأ مفتوحة
Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 16)

-- منطقة التابات
local tabFrame = Instance.new("Frame", mainFrame)
tabFrame.Size = UDim2.new(0, 130, 1, 0)
tabFrame.Position = UDim2.new(0, 0, 0, 0)
tabFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Instance.new("UICorner", tabFrame).CornerRadius = UDim.new(0, 8)

-- منطقة المحتوى
local contentFrame = Instance.new("Frame", mainFrame)
contentFrame.Size = UDim2.new(1, -140, 1, -20)
contentFrame.Position = UDim2.new(0, 140, 0, 10)
contentFrame.BackgroundTransparency = 1

-- دالة لتنظيف المحتوى
local function clearContent()
    for _, v in pairs(contentFrame:GetChildren()) do
        if v:IsA("TextButton") then
            v:Destroy()
        end
    end
end

-- التابات والمحتوى
local tabs = {
    {
        name = "القتال",
        scripts = {
            {"ESP", "https://rawscripts.net/raw/Universal-Script-ESP-10638"},
            {"Aimbot", "https://rawscripts.net/raw/Aimbot-Script-aimbot-11406"},
        }
    },
    {
        name = "السرقة",
        scripts = {
            {"Auto Farm", "https://raw.githubusercontent.com/martinmagdy912/RobloxScripts/main/robbery.lua"},
        }
    },
    {
        name = "بروكهافن",
        scripts = {
            {"تحكم في البيوت", "https://raw.githubusercontent.com/martinmagdy912/RobloxScripts/main/houses.lua"},
        }
    },
    {
        name = "أدوات تنقل",
        scripts = {
            {"طيران", "https://raw.githubusercontent.com/martinmagdy912/RobloxScripts/main/fly.lua"},
            {"فلينق", "https://raw.githubusercontent.com/martinmagdy912/RobloxScripts/main/fling.lua"},
            {"WallHop", "https://rawscripts.net/raw/Universal-Script-wallhop-42706"},
            {"سرعة", "https://raw.githubusercontent.com/martinmagdy912/RobloxScripts/main/speed.lua"},
            {"نط", "https://raw.githubusercontent.com/martinmagdy912/RobloxScripts/main/jump.lua"},
        }
    }
}

-- دالة لتحميل تاب
local function loadTab(tab)
    clearContent()
    for i, scriptInfo in ipairs(tab.scripts) do
        local btn = Instance.new("TextButton", contentFrame)
        btn.Size = UDim2.new(1, -20, 0, 40)
        btn.Position = UDim2.new(0, 10, 0, (i - 1) * 45)
        btn.Text = scriptInfo[1]
        btn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        btn.TextColor3 = Color3.new(1, 1, 1)
        btn.Font = Enum.Font.GothamBold
        btn.TextSize = 18
        Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)

        btn.MouseButton1Click:Connect(function()
            loadstring(game:HttpGet(scriptInfo[2]))()
        end)
    end
end

-- إنشاء أزرار التابات
for i, tab in ipairs(tabs) do
    local tabBtn = Instance.new("TextButton", tabFrame)
    tabBtn.Size = UDim2.new(1, -20, 0, 40)
    tabBtn.Position = UDim2.new(0, 10, 0, (i - 1) * 45 + 10)
    tabBtn.Text = tab.name
    tabBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    tabBtn.TextColor3 = Color3.new(1, 1, 1)
    tabBtn.Font = Enum.Font.Gotham
    tabBtn.TextSize = 18
    Instance.new("UICorner", tabBtn).CornerRadius = UDim.new(0, 6)

    tabBtn.MouseButton1Click:Connect(function()
        loadTab(tab)
    end)
end

-- أول تاب يظهر تلقائي
loadTab(tabs[1])

-- زر DR7 يفتح/يقفل الواجهة
toggleBtn.MouseButton1Click:Connect(function()
    mainFrame.Visible = not mainFrame.Visible
end)