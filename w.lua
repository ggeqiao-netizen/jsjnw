local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local ProximityPromptService = game:GetService("ProximityPromptService")

-- 本地玩家引用
local LP = Players.LocalPlayer
local Character = LP.Character or LP.CharacterAdded:Wait()

local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Syndromehsh/Lua/refs/heads/main/AlienX/AlienX%20Wind%203.0%20UI.txt",true))()

local player = game.Players.LocalPlayer


local Window = WindUI:CreateWindow({
    Title = 'ax HUB',
    Icon = "rbxassetid://4483362748",
    IconThemed = true,
    Author = "",
    Folder = "CloudHub",
    Size = UDim2.fromOffset(400, 300),
    Transparent = true,
    Theme = "Dark",
    Background = "rbxassetid://112743363886763",
    User = {
        Enabled = true,
        Callback = function() print("clicked") end,
        Anonymous = false
    },
    SideBarWidth = 200,
    ScrollBarEnabled = true,
})



Window:EditOpenButton({
    Title = "ax HUB",
    Icon = "monitor", -- 修正图标名（首字母大写）
    CornerRadius = UDim.new(0,16),
    StrokeThickness = 2,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromHex("FF0000")),
        ColorSequenceKeypoint.new(0.16, Color3.fromHex("FF7F00")),
        ColorSequenceKeypoint.new(0.33, Color3.fromHex("FFFF00")),
        ColorSequenceKeypoint.new(0.5, Color3.fromHex("00FF00")),
        ColorSequenceKeypoint.new(0.66, Color3.fromHex("0000FF")),
        ColorSequenceKeypoint.new(0.83, Color3.fromHex("4B0082")),
        ColorSequenceKeypoint.new(1, Color3.fromHex("9400D3"))
    }),
    Draggable = true,
})

local Tabs = {}

Tabs.ElementsSection = Window:Section({
    Title = "首页",
    Icon = "rbxassetid://6026568198",
    Opened = true,
})

Tabs.ZhuanmenSection = Window:Section({
    Title = "专门脚本",
    Opened = true,
})

Tabs.ParagraphTab = Tabs.ElementsSection:Tab({ Title = "首页", Icon = "type" })
Tabs.ButtonTab = Tabs.ElementsSection:Tab({ Title = "通用", Icon = "mouse-pointer-2" })
Tabs.FE1Tab = Tabs.ElementsSection:Tab({ Title = "FE脚本", Icon = "paintbrush" })
Tabs.SpeedTab = Tabs.ZhuanmenSection:Tab({ Title = "极速传奇功能", Icon = "zap" }) 
Tabs.DeliverTab = Tabs.ZhuanmenSection:Tab({ Title = "极速传送", Icon = "zap" }) 
Tabs.AttributeTab = Tabs.ZhuanmenSection:Tab({ Title = "属性修改", Icon = "zap" }) 



Window:SelectTab(1)

Tabs.ParagraphTab:Paragraph({
    Title = "AXIN HUB",
    Desc = "by:TY",
    Image = "https://p2.ssl.qhimgs1.com/t04df25fb9fdc0c1dc8.webp",
    ImageSize = 42,
    Thumbnail = "https://p2.ssl.qhimgs1.com/t04df25fb9fdc0c1dc8.webp",
    ThumbnailSize = 150
})




Tabs.ButtonTab:Slider({
    Title = "跳跃",
    Value = {
        Min = 50,
        Max = 200,
        Default = 50,
    },
    Increment = 1,
    Callback = function(value)
        if game.Players.LocalPlayer.Character then
            game.Players.LocalPlayer.Character.Humanoid.JumpPower = value
        end
    end
})

Tabs.ButtonTab:Slider({
    Title = "移速",
    Value = {
        Min = 16,
        Max = 100,
        Default = 16,
    },
    Increment = 1,
    Callback = function(value)
        if game.Players.LocalPlayer.Character then
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
        end
    end
})

Tabs.ButtonTab:Slider({
    Title = "重力",
    Value = {
        Min = 0.1,
        Max = 500.0,
        Default = 196.2,
    },
    Step = 0.1,
    Callback = function(value)
        game.Workspace.Gravity = value
    end
})

Tabs.ButtonTab:Toggle({
    Title = "夜视",
    Value = false,
    Callback = function(state)
        if state then
            game.Lighting.Ambient = Color3.new(1, 1, 1)  
        else
            game.Lighting.Ambient = Color3.new(0, 0, 0) 
        end
    end
})

local Noclip = false
local NoclipConnection
Tabs.ButtonTab:Toggle({
    Title = "穿墙",
    Value = false,
    Callback = function(state)
        if state then
            Noclip = true
            NoclipConnection = game:GetService("RunService").Stepped:Connect(function()
                if Noclip then
                    local character = game.Players.LocalPlayer.Character
                    if character then
                        for _, part in pairs(character:GetDescendants()) do
                            if part:IsA("BasePart") then
                                part.CanCollide = false
                            end
                        end
                    end
                else
                    NoclipConnection:Disconnect()
                end
            end)
        else
            Noclip = false
            if NoclipConnection then
                NoclipConnection:Disconnect()
            end
        end
    end
})

Tabs.ButtonTab:Button({
    Title = "点击传送工具",
    Callback = function()
        mouse = game.Players.LocalPlayer:GetMouse() tool = Instance.new("Tool") tool.RequiresHandle = false tool.Name = "点击传送" tool.Activated:connect(function() local pos = mouse.Hit+Vector3.new(0,2.5,0) pos = CFrame.new(pos.X,pos.Y,pos.Z) game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos end) tool.Parent = game.Players.LocalPlayer.Backpack
    end
})


Tabs.ButtonTab:Button({
    Title = "肘击",
    Callback = function()
        loadstring(game:HttpGet(('https://raw.githubusercontent.com/0Ben1/fe/main/obf_5wpM7bBcOPspmX7lQ3m75SrYNWqxZ858ai3tJdEAId6jSI05IOUB224FQ0VSAswH.lua.txt'),true))()

    end
})

Tabs.ButtonTab:Button({
    Title = "玩家实时数据",
    Callback = function()
        loadstring(game.HttpGet(game, "https://raw.githubusercontent.com/ke9460394-dot/ugik/refs/heads/main/%E5%AE%9E%E6%97%B6%E6%95%B0%E6%8D%AE.txt"))()

    end
})


Tabs.ButtonTab:Button({
    Title = "查看别人物品栏",
    Callback = function()
        loadstring(game.HttpGet(game, "https://raw.githubusercontent.com/ke9460394-dot/ugik/refs/heads/main/%E7%9C%8B%E7%89%A9%E5%93%81%E6%A0%8F.txt"))()

    end
})

Tabs.FE1Tab:Button({
    Title = "隐身",
    Callback = function()
        loadstring(game.HttpGet(game, "https://pastebin.com/raw/vP6CrQJj"))()
    end
})

Tabs.FE1Tab:Button({
    Title = "蜘蛛侠",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Xingyan777/roblox/refs/heads/main/%E8%9C%98%E8%9B%9B%E4%BE%A0.txt"))()
    end
})

Tabs.FE1Tab:Button({
    Title = "拥抱",
    Callback = function()
        loadstring(game.HttpGet(game, "https://raw.githubusercontent.com/ExploitFin/Animations/refs/heads/main/Front%20and%20Back%20Hug%20Tool"))()
    end
})



Tabs.FE1Tab:Button({
    Title = "隐身2",
    Callback = function()
        loadstring(game.HttpGet(game, "https://pastebin.com/raw/3Rnd9rHf"))()
    end
})

Tabs.FE1Tab:Button({
    Title = "失重",
    Callback = function()
        loadstring(game.HttpGet(game, "https://raw.githubusercontent.com/Rawbr10/Roblox-Scripts/refs/heads/main/0%20Graviy%20Trip%20Universal"))()
    end
})

Tabs.FE1Tab:Button({
    Title = "跳墙",
    Callback = function()
        loadstring(game.HttpGet(game, "https://raw.githubusercontent.com/ScpGuest666/Random-Roblox-script/refs/heads/main/Roblox%20WallHop%20V4%20script"))()
    end
})



Tabs.FE1Tab:Button({
    Title = "前后空翻",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Xingyan777/roblox/refs/heads/main/%E6%97%8B%E8%BD%AC.txt"))()
    end
})


-- 刷速度按钮
Tabs.SpeedTab:Button({
    Title = "刷速度",
    Desc = "",
    Callback = function()
        local code = [[
            local args = {"collectOrb", "Red Orb", "City"}
            while true do
                game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(unpack(args))
                task.wait(0.0001) 
            end
        ]]
        loadstring(code)()
    end
})

-- 刷钻石按钮
Tabs.SpeedTab:Button({
    Title = "刷钻石",
    Desc = "",
    Callback = function()
        local code = [[
            local args = {"collectOrb","Gem","City"}
            while true do
                game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(unpack(args))
                task.wait(0.0003) 
            end
        ]]
        loadstring(code)()
    end
})

-- 传送按钮（陈塘关）
Tabs.DeliverTab:Button({
    Title = "传送到陈塘关😎",
    Desc = "传送到主城区",
    Callback = function()
        pcall(function()
            local plr = game.Players.LocalPlayer
            if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                plr.Character.HumanoidRootPart.CFrame = CFrame.new(2002.0133056640625, 1.2624330520629883, 985.2265625)
            end
        end)
    end
})

-- 传送按钮（蜜雪冰城）
Tabs.DeliverTab:Button({
    Title = "传送到蜜雪冰城🤓",
    Desc = "传送到冰雪区域",
    Callback = function()
        pcall(function()
            local plr = game.Players.LocalPlayer
            if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                plr.Character.HumanoidRootPart.CFrame = CFrame.new(-9675.25, 59.63568115234375, 3783.50146484375)
            end
        end)
    end
})

-- 传送按钮（魔丸山）
Tabs.DeliverTab:Button({
    Title = "传送到魔丸山🤔🤓",
    Desc = "传送到火山区域",
    Callback = function()
        pcall(function()
            local plr = game.Players.LocalPlayer
            if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                plr.Character.HumanoidRootPart.CFrame = CFrame.new(-11052.4189453125, 217.59571838378906, 4898.76416015625)
            end
        end)
    end
})

-- 传送按钮（申公豹）
Tabs.DeliverTab:Button({
    Title = "传送到申公豹😱",
    Desc = "传送到高速公路",
    Callback = function()
        pcall(function()
            local plr = game.Players.LocalPlayer
            if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                plr.Character.HumanoidRootPart.CFrame = CFrame.new(-13095.255859375, 217.59567260742188, 5905.240234375)
            end
        end)
    end
})

-- 属性修改：经验
Tabs.AttributeTab:Input({
    Title = "修改经验(本地效果)",
    Placeholder = "输入经验值",
    Callback = function(arg)
        pcall(function()
            local plr = game:GetService("Players").LocalPlayer
            if plr:FindFirstChild("exp") then
                plr.exp.Value = tonumber(arg) or 0
                WindUI:Notify({Title = "修改成功", Content = "经验值已设置为: "..arg})
            else
                WindUI:Notify({Title = "修改失败", Content = "未找到 exp 变量"})
            end
        end)
    end
})

-- 属性修改：等级
Tabs.AttributeTab:Input({
    Title = "修改等级(本地效果)",
    Placeholder = "输入等级",
    Callback = function(arg)
        pcall(function()
            local plr = game:GetService("Players").LocalPlayer
            if plr:FindFirstChild("level") then
                plr.level.Value = tonumber(arg) or 1
                WindUI:Notify({Title = "修改成功", Content = "等级已设置为: "..arg})
            else
                WindUI:Notify({Title = "修改失败", Content = "未找到 level 变量"})
            end
        end)
    end
})

-- 属性修改：比赛数
Tabs.AttributeTab:Input({
    Title = "修改比赛数(本地效果)",
    Placeholder = "输入比赛数",
    Callback = function(arg)
        pcall(function()
            local plr = game:GetService("Players").LocalPlayer
            if plr.leaderstats and plr.leaderstats:FindFirstChild("Races") then
                plr.leaderstats.Races.Value = tonumber(arg) or 0
                WindUI:Notify({Title = "修改成功", Content = "比赛数已设置为: "..arg})
            else
                WindUI:Notify({Title = "修改失败", Content = "未找到 Races 变量"})
            end
        end)
    end
})

-- 属性修改：圈数
Tabs.AttributeTab:Input({
    Title = "修改圈数(本地效果)",
    Placeholder = "输入圈数",
    Callback = function(arg)
        pcall(function()
            local plr = game:GetService("Players").LocalPlayer
            if plr.leaderstats and plr.leaderstats:FindFirstChild("Hoops") then
                plr.leaderstats.Hoops.Value = tonumber(arg) or 0
                WindUI:Notify({Title = "修改成功", Content = "圈数已设置为: "..arg})
            else
                WindUI:Notify({Title = "修改失败", Content = "未找到 Hoops 变量"})
            end
        end)
    end
})

-- 属性修改：重生次数
Tabs.AttributeTab:Input({
    Title = "修改重生次数(本地效果)",
    Placeholder = "输入重生次数",
    Callback = function(arg)
        pcall(function()
            local plr = game:GetService("Players").LocalPlayer
            if plr.leaderstats and plr.leaderstats:FindFirstChild("Rebirths") then
                plr.leaderstats.Rebirths.Value = tonumber(arg) or 0
                WindUI:Notify({Title = "修改成功", Content = "重生次数已设置为: "..arg})
            else
                WindUI:Notify({Title = "修改失败", Content = "未找到 Rebirths 变量"})
            end
        end)
    end
})

-- 属性修改：步数
Tabs.AttributeTab:Input({
    Title = "修改步数(本地效果)",
    Placeholder = "输入步数",
    Callback = function(arg)
        pcall(function()
            local plr = game:GetService("Players").LocalPlayer
            if plr.leaderstats and plr.leaderstats:FindFirstChild("Steps") then
                plr.leaderstats.Steps.Value = tonumber(arg) or 0
                WindUI:Notify({Title = "修改成功", Content = "步数已设置为: "..arg})
            else
                WindUI:Notify({Title = "修改失败", Content = "未找到 Steps 变量"})
            end
        end)
    end
})

-- 属性修改：尾迹容量
Tabs.AttributeTab:Input({
    Title = "修改尾迹容量(本地效果)",
    Placeholder = "输入容量",
    Callback = function(arg)
        pcall(function()
            local plr = game:GetService("Players").LocalPlayer
            if plr:FindFirstChild("maxPetCapacity") then
                plr.maxPetCapacity.Value = tonumber(arg) or 0
                WindUI:Notify({Title = "修改成功", Content = "尾迹容量已设置为: "..arg})
            else
                WindUI:Notify({Title = "修改失败", Content = "未找到 maxPetCapacity 变量"})
            end
        end)
    end
})

-- 属性修改：宝石数量
Tabs.AttributeTab:Input({
    Title = "修改宝石数量(本地效果)",
    Placeholder = "输入宝石数量",
    Callback = function(arg)
        pcall(function()
            local plr = game:GetService("Players").LocalPlayer
            if plr:FindFirstChild("Gems") then
                plr.Gems.Value = tonumber(arg) or 0
                WindUI:Notify({Title = "修改成功", Content = "宝石数量已设置为: "..arg})
            else
                WindUI:Notify({Title = "修改失败", Content = "未找到 Gems 变量"})
            end
        end)
    end
})


Tabs.buyTab = Tabs.ZhuanmenSection:Tab({ Title = "这个是忍者传奇的🤔", Icon = "zap" })

Tabs.buyTab:Button({
    Title = "自动挥剑",
    Desc = "",
    Callback = function()
    while true do
game:GetService("Players").LocalPlayer.ninjaEvent:FireServer("swingKatana")
wait(0.1)
end
        WindUI:Notify({Title = "开启成功", Content = "开启成功"})
    end
})

Tabs.buyTab:Input({
    Title = "修改双段跳",
    Placeholder = "输入1-100",
    Callback = function(arg)
        pcall(function()
            game:GetService("Players").LocalPlayer.level.Value = tonumber(arg) or 1
            WindUI:Notify({Title = "修改成功", Content = "已设置为: "..arg})
        end)
    end
})

Tabs.buyTab:Input({
    Title = "修改击杀数(本地效果)",
    Placeholder = "输入",
    Callback = function(arg)
        pcall(function()
            game:GetService("Players").LocalPlayer.level.Value = tonumber(arg) or 1
            WindUI:Notify({Title = "修改成功", Content = "已设置为: "..arg})
        end)
    end
})

Tabs.buyTab:Input({
    Title = "修改金币(本地效果)",
    Placeholder = "输入",
    Callback = function(arg)
        pcall(function()
            game:GetService("Players").LocalPlayer.level.Value = tonumber(arg) or 1
            WindUI:Notify({Title = "修改成功", Content = "已设置为: "..arg})
        end)
    end
})
