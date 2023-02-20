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

--// Supported Games
local supportedGames = {
    6767503821, --Underground Bunker Tycoon
    3601201039, -- Farm Life
    10198661638 -- Farm Factory Tycoon
}

--// Main 
for i = 1, #supportedGames do
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

if gameId == 6767503821 then --not really much tbh but works anyway
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
    local crop = "Wheat"
    local cropPrice = 5
    local cropRenewable = false
    local treeType = "Basic"
    local egg = "Small"
    local eggPrice = 1000
    local eggAmount = 1
    local animalDir = Workspace.SpawnedAnimals[userid]
    
    function equipWateringCan()
        if game:GetService("Workspace")[pName]:FindFirstChild("Watering Can") == nil then
            Humanoid:EquipTool(localplayer.Backpack["Watering Can"])
        end
    end

    function getWater()
        local pHead = localplayer.Character.Head
        local pCFrame = localplayer.Character.HumanoidRootPart.CFrame
        plotDir.WellLocation.CFrame = pHead.CFrame
        game:GetService("ReplicatedStorage").Crops.FillWateringCanRequest:InvokeServer(pCFrame)
    end

    function goHome()
        game:GetService("ReplicatedStorage").TeleportRequest.TeleportHomeRequest:FireServer()
    end

    function buyPlantCrops()
        local emptySlots = 0
        local gold = localplayer.leaderstats.Gold.Value
        local amountPossible = math.floor(gold/cropPrice)
        local amountOwned = 0
        local amountNeeded = 0
        local temp = false
        Humanoid:UnequipTools()
        for i, v in pairs(plotDir.CropField["CropSquares-1"]:GetChildren()) do
            if v:IsA("Part") then
                if v.Occupied.Value == false then
                    emptySlots = emptySlots + 1
                end
            end
        end
        print("Found " .. emptySlots .. " empty slots")
        print("You can afford " .. amountPossible .. " " .. string.lower(crop) .. " seeds")
        if amountPossible > emptySlots then
            amountPossible = emptySlots
        end
        if Backpack:FindFirstChild(crop .. " Seeds") then
            amountOwned = Backpack[crop .. " Seeds"].Amount.Value
        end
        print("You own " .. amountOwned .. " " .. string.lower(crop) .. " seeds")
        amountNeeded = amountPossible - amountOwned
        print("Buying " .. amountNeeded .. " " .. string.lower(crop) .. " seeds")
        if amountNeeded > 0 then
            for i = 1, amountNeeded do
                if cropPrice < gold then
                    game:GetService("ReplicatedStorage").Items.BuyItemRequest:InvokeServer(crop .. " Seeds")
                end
            end
        end
        if amountPossible > 0 then
            Humanoid:EquipTool(Backpack[crop .. " Seeds"])
        end
        for i, v in pairs(plotDir.CropField["CropSquares-1"]:GetChildren()) do
            if v:IsA("Part") then
                if v.Occupied.Value == false then
                    if temp == false then
                        teleportTo(v.CFrame)
                        temp = true
                    end
                end
            end
        end
        wait(1)
        for i, v in pairs(plotDir.CropField["CropSquares-1"]:GetChildren()) do
            if v:IsA("Part") then
                if v.Occupied.Value == false then
                    if char:FindFirstChild(crop .. " Seeds") then
                        if char[crop .. " Seeds"].Amount.Value > 0 then
                            teleportTo(v.CFrame)
                            local cropSeeds = string.lower(crop .. "_seeds")
                            game:GetService("ReplicatedStorage").Crops.PlantSeedRequest:InvokeServer(v, cropSeeds)
                        end
                    end
                end
            end
        end
    end

    function waterCrops()
        local temp = false
        for i, v in pairs(plotDir.CropField["CropSquares-1"]:GetChildren()) do
            if v:IsA("Part") then
                if v.Watered.Value == false then
                    if temp == false then
                        teleportTo(v.CFrame)
                        temp = true
                    end
                end
            end
        end
        wait(1)
        for i, v in pairs(plotDir.CropField["CropSquares-1"]:GetChildren()) do
            if v:IsA("Part") then
                if v.Watered.Value == false then
                    print(v.Index.Value .. " is not watered")
                    equipWateringCan()
                    teleportTo(v.CFrame)
                    if char["Watering Can"].WaterLevel.Value == 0 then
                        getWater()
                    end
                    game:GetService("ReplicatedStorage").Crops.PlaceWaterRequest:InvokeServer(v)
                end
            end
        end
    end

    function harvestCrops()
        Humanoid:UnequipTools()
        local temp = false
        for i, v in pairs(plotDir.CropField["CropSquares-1"]:GetChildren()) do
            if v:IsA("Part") then
                if v:FindFirstChild("Crop") then
                    if v.Crop.Harvestable.Value == true then
                        if temp == false then
                            teleportTo(v.CFrame)
                            temp = true
                        end
                    end
                end
            end
        end
        wait(1)
        for i, v in pairs(plotDir.CropField["CropSquares-1"]:GetChildren()) do
            if v:IsA("Part") then
                if v:FindFirstChild("Crop") then
                    if v.Crop.Harvestable.Value == true then
                        print(v.Index.Value .. " is harvestable")
                        teleportTo(v.CFrame)
                        game:GetService("ReplicatedStorage").Crops.HarvestCropRequest:InvokeServer(v, false)
                    end
                end
            end
        end
    end

    function animalStuff()
        for i, v in pairs(animalDir:GetChildren()) do
            if v.Data.PettingTimer.Value == 0 then
                print("Petting " .. v.Name)
                if v:FindFirstChild("ClickDetector") then
                    fireclickdetector(v.ClickDetector)
                    fireclickdetector(v.ClickDetector)
                end
                if v:FindFirstChild("ClickDetector") == nil then
                    fireclickdetector(v.HumanoidRootPart.Hitbox.ClickDetector)
                    fireclickdetector(v.HumanoidRootPart.Hitbox.ClickDetector)
                end
            end
        end
        local temp = 0
        for i, v in pairs(plotDir.AnimalPen.DroppedProducts:GetChildren()) do
            if v.Hitbox:FindFirstChild("TouchInterest") then
                firetouchinterest(localplayer.Character.HumanoidRootPart, v.Hitbox, 0)
                firetouchinterest(localplayer.Character.HumanoidRootPart, v.Hitbox, 1)
                temp = temp + 1
            end
        end
        if temp > 0 then
            print("Picked up " .. temp .. " products")
        end
    end

    function castRod(CFrame)
        game:GetService("ReplicatedStorage").Items.CastFishingRodRequest:InvokeServer(CFrame)
    end

    function sellAll()
        teleportTo(plotDir.Bin.SellTitle.CFrame)
        for i, v in pairs(Backpack:GetDescendants()) do
            if v:IsA("Tool") then
                if v.Name ~= ("Watering Can" or "Shovel" or "Bamboo Rod" or "Wheat Seeds" or "Wooden Axe") then
                    print("Selling " .. v.Amount.Value .. " " .. v.Name)
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

    function fastRoll()
        local gold = localplayer.leaderstats.Gold.Value
        for i = 1, eggAmount do
            local eggName = string.lower(egg) .. "Pen"
            game:GetService("ReplicatedStorage").Roll.RollCrateRequest:InvokeServer("smallPen")
        end
    end

    local Toggle = Section:Toggle({
        Name = "Autofarm Crops", -- String
        Default = false, -- Boolean
        Callback = function(Bool)
            Autofarm = Bool
    
            if Autofarm then
                while Autofarm == true do
                    print("---")
                    print("Starting Loop")
                    buyPlantCrops()
                    wait(0.1)
                    equipWateringCan()
                    wait(0.1)
                    waterCrops()
                    wait(0.1)
                    harvestCrops()
                    wait(0.1)
                    sellAll()
                    print("Finished Loop")
                    print("---")
                    wait(0.1)
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
                    for i, v in pairs(game:GetService("Workspace").Foraging.SpawnPoints:GetChildren()) do
                        if v.Occupied.Value == true then
                            for i, v in pairs(v:GetDescendants()) do
                                if v:IsA("ClickDetector") then
                                    if ForagingFarm == true then
                                        teleportTo(v.Parent.CFrame)
                                        fireclickdetector(v)
                                    end
                                end
                            end
                        end
                    end
                    wait(0.1)
                    if ForagingFarm == false then
                        goHome()
                    end
                end
            end
        end
    })

    local Button = Section:Button({
        Name = "Buy & Plant Crop", -- String
        Callback = function()
            buyPlantCrops()
        end
    })

    local Dropdown = Section:Dropdown({
        Name = "Crop To Farm", -- String
        Items = {"Wheat", "Carrot", "Onion", "Pumpkin", "Corn", "Watermelon", "Strawberry", "Potato", "Tomato", "Grape", "Pineapple", "Chilli", "Turnip", "Cucumber"}, -- Table
        Callback = function(item)
            crop = item
            if crop == "Wheat" then
                cropPrice = 5
                cropRenewable = false
            end
            if crop == "Carrot" then
                cropPrice = 16
                cropRenewable = false
            end
            if crop == "Onion" then
                cropPrice = 18
                cropRenewable = false
            end
            if crop == "Pumpkin" then
                cropPrice = 250
                cropRenewable = false
            end
            if crop == "Corn" then
                cropPrice = 300
                cropRenewable = true
            end
            if crop == "Watermelon" then
                cropPrice = 400
                cropRenewable = false
            end
            if crop == "Strawberry" then
                cropPrice = 400
                cropRenewable = true
            end
            if crop == "Potato" then
                cropPrice = 900
                cropRenewable = false
            end
            if crop == "Tomato" then
                cropPrice = 2000
                cropRenewable = false
            end
            if crop == "Grape" then
                cropPrice = 3000
                cropRenewable = true
            end
            if crop == "Pineapple" then
                cropPrice = 3600
                cropRenewable = false
            end
            if crop == "Chilli" then
                cropPrice = 3750
                cropRenewable = true
            end
            if crop == "Turnip" then
                cropPrice = 6200
                cropRenewable = false
            end
            if crop == "Cucumber" then
                cropPrice = 12000
                cropRenewable = false
            end
        end
    })

    local Button = Section:Button({
        Name = "Water Crops", -- String
        Callback = function()
            waterCrops()
        end
    })

    local Button = Section:Button({
        Name = "Harvest Crops", -- String
        Callback = function()
            harvestCrops()
        end
    })

    local Toggle = Section:Toggle({
        Name = "Animal Stuff", -- String
        Default = false, -- Boolean
        Callback = function(Bool)
            AnimalStuff = Bool
    
            if AnimalStuff then
                while AnimalStuff == true do
                    animalStuff()
                    wait(1)
                end
            end
        end
    })

    local Toggle = Section:Toggle({
        Name = "Farm Trees", -- String
        Default = false, -- Boolean
        Callback = function(Bool)
            FarmTrees = Bool
    
            if FarmTrees then

                Humanoid:UnequipTools()
                if Backpack:FindFirstChild("Wooden Axe") == nil then
                    print("Please get a wooden axe first!")
                    FarmTrees = false
                end
                if FarmTrees == true then
                    Humanoid:EquipTool(Backpack:FindFirstChild("Wooden Axe"))
                end
                while FarmTrees == true do
                    for i, v in pairs(game:GetService("Workspace").Forest.SpawnPoints:GetDescendants()) do
                        if FarmTrees then
                            if v:FindFirstChild(treeType) then
                                -- This one is hard so I'm using a Hydroxide generated remote
                                local ohInstance1 = v[treeType].Trunk
                                local ohTable2 = {
                                    ["description"] = "Chop Trees",
                                    ["axe"] = true,
                                    ["id"] = "Wooden Axe",
                                    ["storeCategory"] = "Tools",
                                    ["stackTag"] = "axe",
                                    ["textureId"] = "rbxassetid://3637797344",
                                    ["damage"] = 20,
                                    ["chopStrength"] = 1,
                                    ["stackable"] = false,
                                    ["cooldownWaitTime"] = 0.8,
                                    ["buyPrice"] = 500,
                                    ["singleOnly"] = true
                                }

                                game:GetService("ReplicatedStorage").Trees.TreeHitRequest:InvokeServer(ohInstance1, ohTable2)
                                wait(0.1)
                            end
                        end
                    end
                end
            end
        end
    })

    local Dropdown = Section:Dropdown({
        Name = "Tree Type", -- String
        Items = {"Basic", "Aspen"}, -- Table
        Callback = function(item)
            treeType = item
        end
    })

    local Toggle = Section:Toggle({
        Name = "Auto Fish", -- String
        Default = false, -- Boolean
        Callback = function(Bool)
            AutoFish = Bool
    
            if AutoFish then
                Humanoid:UnequipTools()
                if Backpack:FindFirstChild("Bamboo Rod") then
                    Humanoid:EquipTool(Backpack["Bamboo Rod"])
                    while AutoFish == true do
                        if char["Bamboo Rod"].Casting.Value == false then
                            castRod(plotDir.WaterSource.CFrame)
                        end
                        wait(0.1)
                    end
                end
                if Backpack:FindFirstChild("Bamboo Rod") == nil then
                    print("Please get a bamboo rod first!")
                end
            end
        end
    })

    local Button = Section:Button({
        Name = "Sell All", -- String
        Callback = function()
            sellAll()
        end
    })

    local Button = Section:Button({
        Name = "Fast Roll", -- String
        Callback = function()
            fastRoll()
        end
    })

    local Dropdown = Section:Dropdown({
        Name = "Roll Type", -- String
        Items = {"Small", "Large"}, -- Table
        Callback = function(item)
            egg = item
            if egg == "Small" then
                eggPrice = 1000
            end
            if egg == "Large" then
                eggPrice = 10000
            end
        end
    })

    local Slider = Section:Slider({
        Name = "Roll Amount", -- String
        Max = 10, -- Integer
        Min = 1, -- Integer
        Default = 1, -- Integer
        Callback = function(Value)
                eggAmount = Value
          end
    })

    wait(0.1)
    Slider:SetValue(1) -- Integer

end

if gameId == 10198661638 then --unfinishes
    local tycoonDir = nil
    local hasTycoon = false
    for i, v in pairs(game:GetService("Workspace").Tycoon:GetChildren()) do
        if tostring(v.Onwer.Value) == pName then
            tycoonDir = v
            hasTycoon = true
            print("You own tycoon " .. tostring(tycoonDir))
        end
    end

    if hasTycoon == false then
        for i, v in pairs(game:GetService("Workspace").Tycoon:GetChildren()) do
            if v.Onwer.Value == nil then
                if hasTycoon == false then
                    teleportTo(v.Base.Touch.CFrame)
                    tycoonDir = v
                    hasTycoon = true
                    print("Claimed tycoon " .. tostring(tycoonDir))
                end
            end
        end
    end
    
    local Toggle = Section:Toggle({
        Name = "Spam Offline Reward (Inf Cash)", -- String
        Default = false, -- Boolean
        Callback = function(Bool)
            SpamOffline = Bool
    
            if SpamOffline then
                while SpamOffline == true do
                    game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Event"):WaitForChild("Offline"):WaitForChild("[S-C]TryGetFreeReward"):FireServer()
                    wait(0.1)
                end
            end
        end
    })

    local Toggle = Section:Toggle({ -- Crashes
        Name = "Loop Buy Buttons", -- String
        Default = false, -- Boolean
        Callback = function(Bool)
            BuyButtons = Bool
    
            if BuyButtons then
                while BuyButtons == true do
                    local cash = localplayer.Eco.cash.Value
                    print(cash)
                    for i, v in pairs (tycoonDir.Buttons:GetChildren()) do
                        print(v.Name, v.Price.Value)
                        if v.Price.Value < cash then
                            print("Bought " .. v.Name)
                            firetouchinterest(Humanoid, v.Head, 0)
                            firetouchinterest(Humanoid, v.Head, 1)
                        end
                    end
                    wait(0.1)
                end
            end
        end
    })

    local Toggle = Section:Toggle({
        Name = "Complete Obbies", -- String
        Default = false, -- Boolean
        Callback = function(Bool)
            CompleteObbies = Bool
    
            if CompleteObbies then
                while CompleteObbies == true do
                    if game:GetService("Workspace").Obby.Wall:FindFirstChild("Obby1Wall") == nil then
                        teleportTo(game:GetService("Workspace").Obby.Obby1.End.CFrame)
                        wait(0.1)
                    end
                    if game:GetService("Workspace").Obby.Wall:FindFirstChild("Obby2Wall") == nil then
                        teleportTo(game:GetService("Workspace").Obby.Obby2.End.CFrame)
                        wait(0.1)
                    end
                    if game:GetService("Workspace").Obby.Wall:FindFirstChild("Obby3Wall") == nil then
                        teleportTo(game:GetService("Workspace").Obby.Obby3.End.CFrame)
                        wait(0.1)
                    end
                    wait(1)
                end
            end
        end
    })

    local Button = Section:Button({
        Name = "Get Free Stuff", -- String
        Callback = function()
            game:GetService("ReplicatedStorage").Remote.Event.RandomGift["[C-S]GetFreeGoldEgg"]:FireServer()
            game:GetService("ReplicatedStorage").Remote.Event.RandomGift["[C-S]GetFreeGoldMilk"]:FireServer()
            game:GetService("ReplicatedStorage").Remote.Event.RandomGift["[C-S]GetFreeGoldWool"]:FireServer()
            game:GetService("ReplicatedStorage").Remote.Function.Spin["[C-S]TryUseFreeSpin"]:InvokeServer()
        end
    })

    local Button = Section:Button({
        Name = "Teleport To Tycoon", -- String
        Callback = function()
            teleportTo(tycoonDir.Base.Teleport.CFrame)
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
