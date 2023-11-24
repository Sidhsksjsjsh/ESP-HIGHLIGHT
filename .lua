local Library = 
loadstring(Game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))()
local Window_1 = Library:NewWindow("HIGHLIGHT")

local Tab1 = Window_1:NewSection("Main")
local Tab2 = Window_1:NewSection("Highlight Settings")


local enabled = false
local filluseteamcolor = false
local outlineuseteamcolor = false
local fillcolor = Color3.new(0,1,0)
local outlinecolor = Color3.new(1,1,1)
local filltrans = 0
local outlinetrans = 0


--[[local holder = game.CoreGui:FindFirstChild("ESPHolder") or Instance.new("Folder")
if enabled == false then
    holder:Destroy()
end


if holder.Name == "Folder" then
    holder.Name = "ESPHolder"
    holder.Parent = game.CoreGui
end


if uselocalplayer == false and holder:FindFirstChild(game.Players.LocalPlayer.Name) then
    holder:FindFirstChild(game.Players.LocalPlayer.Name):Destroy()
end
]]

if enabled == true then 
    enabled = false
    enabled = true
end

Tab1:CreateToggle("Enable HIGHLIGHT", function(value)
enabled = value
end)

--[[
local filluseteamcolor = false
local outlineuseteamcolor = false
local fillcolor = Color3.new(0, 0, 0)
local outlinecolor = Color3.new(1, 1, 1)
local filltrans = 0
local outlinetrans = 0
]]

Tab2:CreateToggle("Team Check", function(value)
filluseteamcolor = value
outlineuseteamcolor = value
end)

Tab2:CreateToggle("No Chams", function(value)
if value then
   filltrans = 1
else
   filltrans = 0
end
end)

Tab2:CreateToggle("No Outline", function(value)
if value then
   outlinetrans = 1
else
   outlinetrans = 0
end
end)

while enabled do
    task.wait()
    for _,v in pairs(game.Players:GetChildren()) do
        local chr = v.Character
        if chr ~= nil then
        local esp = Instance.new("Highlight")
        esp.Name = v.Name
        if uselocalplayer == false and esp.Name == game.Players.LocalPlayer.Name then
            else
        esp.Parent = v.Character
        if filluseteamcolor then
            esp.FillColor = v.TeamColor.Color
        else
            esp.FillColor = fillcolor 
        end
        if outlineuseteamcolor then
            esp.OutlineColor = v.TeamColor.Color
        else
            esp.OutlineColor = outlinecolor    
        end
        if not enabled then
          esp:Destroy()
        end
        esp.FillTransparency = filltrans
        esp.OutlineTransparency = outlinetrans
        esp.Adornee = chr
        esp.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        end
        end
    end
end
