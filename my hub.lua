--Please dont read this my coding is gonna be shit

--// Variables
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local localplayer = game.Players.LocalPlayer
local char = localplayer.Character
local Humanoid = char.Humanoid
local HumanoidRootPart = char.HumanoidRootPart
local userid = localplayer.UserId
local pPosition = localplayer.Character.HumanoidRootPart.Position
local pCFrame = localplayer.Character.HumanoidRootPart.CFrame
local pHead = localplayer.Character.Head
local pName = localplayer.Name
local gameId = game.PlaceId
local pTeam = localplayer.Team
local Backpack = localplayer.Backpack

--// Libraries
local Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/Loco-CTO/UI-Library/main/VisionLibV2/source.lua'))()
--NotificationLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/IceMinisterq/Notification-Library/Main/Library.lua"))()

--// Supported Games
local supportedGames = {
    10894722579, --Feed The Noob Tycoon
    10347946161, --Rat Washing Tycoon
    6767503821, --Underground Bunker Tycoon
    3601201039 -- Farm Life
}

--// Main 
for i = 1, #supportedGames do
    --if the gameId is equal to the current value in the table
    if gameId == supportedGames[i] then
        print("Game Supported!")
    end
end

function teleportTo(position)
    if localplayer.Character then
        localplayer.Character.HumanoidRootPart.CFrame = position
    end
end

local Window = Library:Create({
    Name = "AAAAAH!!!", -- String
    Footer = "I HATE LUA!!!", -- String
    ToggleKey = Enum.KeyCode.RightShift, -- Enum.KeyCode
    LoadedCallback = function()
        -- Function
    end,
    
    KeySystem = false, -- Boolean
    Key = "keyabc123", -- String
    MaxAttempts = 5, -- Integer
    DiscordLink = "https://discord.gg/Bp7wFcZeUn", -- String (Set it to nil if you do not have one, the button will not pop out)
    ToggledRelativeYOffset = 5 -- Number (Y Offset from bottom of your screen. Set it to nil if you want it to be centred)
})

local Tab = Window:Tab({
    Name = "Main", -- String
    Icon = "rbxassetid://11396131982", -- String
    Color = Color3.new(1, 0, 0) -- Color3
})

local Section = Tab:Section({
    Name = "Main" -- String
})

if gameId == 10894722579 then
    print("Start")
    local tycoonDir = nil
    local function getTycoon()
        for i, v in pairs(game:GetService("Workspace").Tycoons:GetChildren()) do
            if tostring(v.TycoonInfo.Owner.Value) == pName then
                tycoonDir = v
                print("You own tycoon " .. v.Name)
            end
        end
    end

    local LoopGrabFood = false

    local Toggle = Section:Toggle({
    Name = "Loop Grab Food", -- String
    Default = false, -- Boolean
    Callback = function(Bool)
        LoopGrabFood = Bool

        if Tycoon == nil then
            getTycoon()
        end

        if LoopGrabFood then
            while LoopGrabFood == true do
                for i, v in pairs(tycoonDir.ItemDebris:GetChildren()) do
                    v.CanCollide = false
                    v.Position = localplayer.Character.HumanoidRootPart.Position
                end
                wait(1)
            end
        end
    end
    })
end

if gameId == 10347946161 then
    TycoonName = game:GetService("ReplicatedStorage").Knit.Services.TycoonService.RF.getTycoon:InvokeServer()
    Tycoon = game:GetService("Workspace").Tycoons[tostring(TycoonName)]
    
    local Toggle = Section:Toggle({
        Name = "Loop Grab Rats",
        Default = false,
        Callback = function(Bool)
            LoopGrabRats = Bool
            if LoopGrabRats then
                while LoopGrabRats == true do
                    Tycoon.Rats.ChildAdded:Connect(function(child)
                        child.Part.Position = localplayer.Character.HumanoidRootPart.Position
                    end)
                end
            end
        end
    })
    
    local Button = Section:Button({
        Name = "Grab Rats", -- String
        Callback = function()
            for i, v in pairs(Tycoon.Rats:GetChildren()) do
                v.Part.Position = localplayer.Character.HumanoidRootPart.Position
            end
        end
    })
end

if gameId == 6767503821 then
    local tycoonDir = nil
    local function getTycoon()
        if tostring(Workspace.Tycoon.Bunker1.Properties.Owner.Value) == pName then
            tycoonDir = game:GetService("Workspace").Tycoon.Bunker1
        end
        if tostring(Workspace.Tycoon.Bunker2.Properties.Owner.Value) == pName then
            tycoonDir = game:GetService("Workspace").Tycoon.Bunker2
        end
        if tostring(Workspace.Tycoon.Bunker3.Properties.Owner.Value) == pName then
            tycoonDir = game:GetService("Workspace").Tycoon.Bunker3
        end
        if tostring(Workspace.Tycoon.Bunker4.Properties.Owner.Value) == pName then
            tycoonDir = game:GetService("Workspace").Tycoon.Bunker4
        end
    end

    local Toggle = Section:Toggle({
        Name = "Loop Click Dropper", -- String
        Default = false, -- Boolean
        Callback = function(Bool)
            LoopClickDropper = Bool
    
            if Tycoon == nil then
                getTycoon()
            end
    
            if LoopClickDropper then
                while LoopClickDropper == true do
                    fireclickdetector(tycoonDir.Buildings.Mine.Button.ClickDetector)
                    wait(0.2)
                end
            end
        end
    })

    local Toggle = Section:Toggle({
        Name = "Loop Collect Cash", -- String
        Default = false, -- Boolean
        Callback = function(Bool)
            LoopCollectCash = Bool
    
            if Tycoon == nil then
                getTycoon()
            end
    
            if LoopCollectCash then
                while LoopCollectCash == true do
                    firetouchinterest(pHead, tycoonDir.tycoonThings.CollectorParts.cashCollector.CollectCash, 0)
                    firetouchinterest(pHead, tycoonDir.tycoonThings.CollectorParts.cashCollector.CollectCash, 1)
                    wait(1)
                end
            end
        end
    })
end

if gameId == 3601201039 then --autofarm not done
    local plot = ("FarmPlot-" .. userid)
    local plotDir = Workspace[plot]
    local WaterSource = plotDir.WaterSource
    
    function equipWateringCan()
        if game:GetService("Workspace")[pName]:FindFirstChild("Watering Can") == nil then
            Humanoid:EquipTool(localplayer.Backpack:WaitForChild("Watering Can"))
        end
    end

    function getWater()
        plotDir.WellLocation.CFrame = pCFrame
        wait(0.05)
        game:GetService("ReplicatedStorage").Crops.FillWateringCanRequest:InvokeServer(pCFrame)
    end

    local Toggle = Section:Toggle({
        Name = "Autofarm", -- String
        Default = false, -- Boolean
        Callback = function(Bool)
            Autofarm = Bool
    
            if Autofarm then
                while Autofarm == true do
                    for i, v in pairs(plotDir.CropField["CropSquares-1"]:GetDescendants()) do
                        if v:IsA("Part") then
                            if v.Watered == false then
                                equipWateringCan()
                                if Workspace[pName]["Watering Can"].WaterLevel.Value == 0 then
                                    teleportTo(WaterSource.CFrame)
                                    wait(0.1)
                                    getWater()
                                end
                                teleportTo(v.CFrame)
                                game:GetService("ReplicatedStorage").Crops.PlaceWaterRequest:InvokeServer(v)
                                Humanoid:UnequipTools()
                            end
                            if v.Occupied == true then 
                                    cropName = v.Crop.CropType.Value
                            end
                            if v.Crop.Harvestable.Value == true then
                                teleportTo(v.CFrame)
                                game:GetService("ReplicatedStorage").Crops.HarvestCropRequest:InvokeServer(v,false)
                            end
                        end
                    end
                    local totalCropAmount = 0
                    teleportTo(plotDir.Bin.SellTitle.CFrame)
                    if localplayer.Backpack:FindFirstChild(cropName) then
                        Humanoid:EquipTool(localplayer.Backpack:WaitForChild(cropName))
                        local cropAmount = Workspace[pName][cropName].Amount.Value
                        totalCropAmount = totalCropAmount + cropAmount
                        for i = 1, cropAmount do
                            game:GetService("ReplicatedStorage").Items.SellItemRequest:InvokeServer(plotDir:WaitForChild("Bin"))
                        end
                    end
                    if localplayer.Backpack:FindFirstChild("Quality",cropName) then
                        Humanoid:EquipTool(localplayer.Backpack:WaitForChild("Quality",cropName))
                        local cropAmount = Workspace[pName]["Quality "..cropName].Amount.Value
                        totalCropAmount = totalCropAmount + cropAmount
                        for i = 1, cropAmount do
                            game:GetService("ReplicatedStorage").Items.SellItemRequest:InvokeServer(plotDir:WaitForChild("Bin"))
                        end
                    end
                    if localplayer.Backpack:FindFirstChild("High Quality",cropName) then
                        Humanoid:EquipTool(localplayer.Backpack:WaitForChild("High Quality",cropName))
                        local cropAmount = Workspace[pName]["High Quality "..cropName].Amount.Value
                        totalCropAmount = totalCropAmount + cropAmount
                        for i = 1, cropAmount do
                            game:GetService("ReplicatedStorage").Items.SellItemRequest:InvokeServer(plotDir:WaitForChild("Bin"))
                        end
                    end
                    for i = 1, totalCropAmount do
                        game:GetService("ReplicatedStorage"):WaitForChild("Items"):WaitForChild("BuyItemRequest"):InvokeServer(cropName.." Seeds")
                    end
                    Humanoid:EquipTool(localplayer.Backpack:WaitForChild(cropName .." Seeds"))
                    for i, v in pairs(plotDir.CropField["CropSquares-1"]:GetDescendants()) do
                        if v:IsA("Part") then
                            if v.Occupied == false then
                                teleportTo(v.CFrame)
                                local cropSeed = cropName .."_seeds"
                                game:GetService("ReplicatedStorage").Crops.PlaceSeedRequest:InvokeServer(v,cropSeed)
                            end
                        end
                    end
                end
            end
        end
    })

    local Toggle = Section:Toggle({
        Name = "Farm Berries & Mushrooms", -- String
        Default = false, -- Boolean
        Callback = function(Bool)
            ForagingFarm = Bool
    
            if ForagingFarm then
                while ForagingFarm == true do
                    for i, v in pairs(game:GetService("Workspace").Foraging.SpawnPoints:GetDescendants()) do
                        if v:IsA("ClickDetector") then
                            if ForagingFarm then
                                teleportTo(v.Parent.CFrame)
                                wait(0.05)
                                fireclickdetector(v)
                                wait(0.05)
                            end
                            if ForagingFarm == false then
                                game:GetService("ReplicatedStorage").TeleportRequest.TeleportHomeRequest:FireServer()
                                break
                            end
                        end
                    end
                end
            end
        end
    })

    local Button = Section:Button({
        Name = "Sell All", -- String
        Callback = function()
            teleportTo(plotDir.Bin.SellTitle.CFrame)
            for i, v in pairs(Backpack:GetDescendants()) do
                if v:IsA("Tool") then
                    if v.Name ~= "Watering Can" or "Shovel" or "Bamboo Rod" or "Wheat Seeds" or "Wooden Axe" then
                        print(v.Name)
                        Humanoid:EquipTool(v)
                        local itemAmount = Workspace[pName][v.Name].Amount.Value
                        for i = 1, itemAmount do
                            game:GetService("ReplicatedStorage").Items.SellItemRequest:InvokeServer(plotDir:WaitForChild("Bin"))
                        end
                    end
                end
            end
            Humanoid:UnequipTools()
        end
    })


    local Button = Section:Button({
        Name = "Get Water", -- String
        Callback = function()
            local equipped = true
            if game:GetService("Workspace")[pName]:FindFirstChild("Watering Can") == nil then
                Humanoid:EquipTool(localplayer.Backpack:WaitForChild("Watering Can"))
                equipped = false
            end
            getWater()
            if equipped == false then
                Humanoid:UnequipTools()
            end
        end
    })
end

local Tab = Window:Tab({
    Name = "Settings", -- String
    Icon = "rbxassetid://7059346373", -- String
    Color = Color3.new(1, 0, 0) -- Color3
})

local Section = Tab:Section({
    Name = "Settings" -- String
})

local Button = Section:Button({
    Name = "Unload", -- String
    Callback = function()
        Library:Destroy()
    end
})


