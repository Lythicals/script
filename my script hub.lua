--Please dont read this my coding is gonna be shit (FYI: First time coding in lua soo yeah)

--// Variables
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local localplayer = game.Players.LocalPlayer
local Character = localplayer.Character
local Humanoid = Character.Humanoid
local HumanoidRootPart = Character.HumanoidRootPart
local userid = localplayer.UserId
local pPosition = localplayer.Character.HumanoidRootPart.Position
local pCFrame = localplayer.Character.HumanoidRootPart.CFrame
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
    10198661638, -- Farm Factory Tycoon
    11877743732, -- Zombie Battle Tycoon (Still Learning How To Code For This One)
    11636413564, -- Meme Mergers
    12299415668, -- Aggressive Multiplayer
    8549934015, -- REx: Reincarnated
    10925589760 -- Merge Simulator
}

--// Main 
if table.find(supportedGames, gameId) == nil then
    print("Game not supported")
else
    print("Game supported")
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
                        firetouchinterest(HumanoidRootPart, tycoonDir.tycoonThings.CollectorParts.cashCollector.CollectCash, 0)
                        firetouchinterest(HumanoidRootPart, tycoonDir.tycoonThings.CollectorParts.cashCollector.CollectCash, 1)
                        wait(1)
                    end
                end
            end
        })
    end

    if gameId == 3601201039 then
        local plot = ("FarmPlot-" .. userid)
        local plotDir = Workspace[plot]
        local cropSquare = "CropSquares-1"
        local crop = "Wheat"
        local cropPrice = 5
        local cropRenewable = false
        local treeType = "Basic"
        local axeLevel = 0
        local axeMinLevel = 1
        local axeUsing = "Wooden Axe"
        local rollItem = "smallPen"
        local rollPrice = 1000
        local rollAmount
        local freeAnimal = "Alligator"
        local animalDir = Workspace.SpawnedAnimals[userid]
        local wateringCan = "Watering Can"
        local desiredMoney = 100000
        local unsellables = {
            "Bamboo Rod",
            "Fiberglass Rod",
            "Gold Rod",
            "Diamond Rod",
            "Enchanted Rod",
            "Wooden Axe",
            "Iron Axe",
            "Gold Axe",
            "Diamond Axe",
            "Enchanted Axe",
            "Watering Can",
            "Iron Watering Can",
            "Gold Watering Can",
            "Diamond Can",
            "Enchanted Can",
            "Shovel",
            "Wheat Seeds",
            "Shears",
            "Sprinkler",
            "Gold Sprinkler"
        }
        
        function equipWateringCan()
            if Backpack:FindFirstChild("Watering Can") then
                Humanoid:EquipTool(Backpack:FindFirstChild("Watering Can"))
                wateringCan = "Watering Can"
            elseif Backpack:FindFirstChild("Iron Watering Can") then
                Humanoid:EquipTool(Backpack:FindFirstChild("Iron Watering Can"))
                wateringCan = "Iron Watering Can"
            elseif Backpack:FindFirstChild("Gold Watering Can") then
                Humanoid:EquipTool(Backpack:FindFirstChild("Gold Watering Can"))
                wateringCan = "Gold Watering Can"
            elseif Backpack:FindFirstChild("Diamond Can") then
                Humanoid:EquipTool(Backpack:FindFirstChild("Diamond Can"))
                wateringCan = "Diamond Can"
            elseif Backpack:FindFirstChild("Enchanted Can") then
                Humanoid:EquipTool(Backpack:FindFirstChild("Enchanted Can"))
                wateringCan = "Enchanted Can"
            end
            print("Equipped " .. wateringCan)
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
            Humanoid:UnequipTools()
            for i = 1, 2 do
                if plotDir.CropField["CropSquares-" .. tostring(i)].Unlocked.Value then
                    for i, v in pairs(plotDir.CropField["CropSquares-" .. tostring(i)]:GetChildren()) do
                        if v:IsA("Part") then
                            if v.Occupied.Value == false then
                                emptySlots = emptySlots + 1
                            end
                        end
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
            for i = 1, 2 do
                local temp = false
                if plotDir.CropField["CropSquares-" .. tostring(i)].Unlocked.Value then
                    print("Planting CropSquares-" .. tostring(i))
                    for i, v in pairs(plotDir.CropField["CropSquares-" .. tostring(i)]:GetChildren()) do
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
                    for i, v in pairs(plotDir.CropField["CropSquares-" .. tostring(i)]:GetChildren()) do
                        if v:IsA("Part") then
                            if v.Occupied.Value == false then
                                if Character:FindFirstChild(crop .. " Seeds") then
                                    if Character[crop .. " Seeds"].Amount.Value > 0 then
                                        teleportTo(v.CFrame)
                                        local cropSeeds = string.lower(crop .. "_seeds")
                                        game:GetService("ReplicatedStorage").Crops.PlantSeedRequest:InvokeServer(v, cropSeeds)
                                    end
                                end
                            end
                        end
                    end
                    print("CropSquares-" .. tostring(i)  .. " Done")
                end
            end
        end

        function waterCrops()
            Humanoid:UnequipTools()
            for i = 1, 2 do
                local temp = false
                if plotDir.CropField["CropSquares-" .. tostring(i)].Unlocked.Value then
                    print("Watering CropSquares-" .. tostring(i))
                    for i, v in pairs(plotDir.CropField["CropSquares-" .. tostring(i)]:GetChildren()) do
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
                    for i, v in pairs(plotDir.CropField["CropSquares-" .. tostring(i)]:GetChildren()) do
                        if v:IsA("Part") then
                            if v.Watered.Value == false then
                                print(v.Index.Value .. " is not watered")
                                equipWateringCan()
                                teleportTo(v.CFrame)
                                if Character[wateringCan].WaterLevel.Value == 0 then
                                    getWater()
                                end
                                game:GetService("ReplicatedStorage").Crops.PlaceWaterRequest:InvokeServer(v)
                            end
                        end
                    end
                    print("CropSquares-" .. tostring(i) .. " Done")
                end
            end
        end

        function harvestCrops()
            Humanoid:UnequipTools()
            for i = 1, 2 do
                local temp = false
                if plotDir.CropField["CropSquares-" .. tostring(i)].Unlocked.Value then
                    print("CropSquares-" .. tostring(i))
                    for i, v in pairs(plotDir.CropField["CropSquares-" .. tostring(i)]:GetChildren()) do
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
                    for i, v in pairs(plotDir.CropField["CropSquares-" .. tostring(i)]:GetChildren()) do
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
                    print("CropSquares-1 Done")
                end
            end
        end

        function animalStuff()
            for i, v in pairs(animalDir:GetChildren()) do
                if v.Data.PettingTimer.Value == 0 and v.Data.Happiness.Value < 100 then
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
                print("Picked up " .. temp .. " products from the animal pen")
            end
            local temp = 0
            for i, v in pairs(plotDir.LargeAnimalPen.DroppedProducts:GetChildren()) do
                if v.Hitbox:FindFirstChild("TouchInterest") then
                    firetouchinterest(localplayer.Character.HumanoidRootPart, v.Hitbox, 0)
                    firetouchinterest(localplayer.Character.HumanoidRootPart, v.Hitbox, 1)
                    temp = temp + 1
                end
            end
            if temp > 0 then
                print("Picked up " .. temp .. " products from the large animal pen")
            end
        end

        function castRod(CFrame)
            game:GetService("ReplicatedStorage").Items.CastFishingRodRequest:InvokeServer(CFrame)
        end

        function sellAll()
            for i, v in pairs(Backpack:GetChildren()) do
                if table.find(unsellables, v.Name) == nil then
                    print("Selling " .. v.Amount.Value .. " " .. v.Name)
                    Humanoid:EquipTool(v)
                    local itemAmount = Workspace[pName][v.Name].Amount.Value
                    for i = 1, itemAmount do
                        game:GetService("ReplicatedStorage").Items.SellItemRequest:InvokeServer(plotDir:WaitForChild("Bin"))
                    end
                end
            end
            Humanoid:UnequipTools()
        end

        function fastRoll()
            local gold = localplayer.leaderstats.Gold.Value
            if rollAmount ~= nil then
                totalPrice = rollPrice * rollAmount
                print("Price of rolls is " .. totalPrice)
                if totalPrice < gold then
                    for i = 1, rollAmount do
                        game:GetService("ReplicatedStorage").Roll.RollCrateRequest:InvokeServer(rollItem)
                    end
                else
                    print("Not enough gold")
                end
            else
                print("Enter a roll amount")
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
                                            wait(0.1)
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
                    localplayer.PlayerScripts.AnimalInfo.RequestHandler.Enabled = false
                    localplayer.PlayerScripts.AnimalInfo.RequestHandler.Disabled = true
                    while AnimalStuff == true do
                        animalStuff()
                        wait(0.1)
                        if AnimalStuff == false then
                            localplayer.PlayerScripts.AnimalInfo.RequestHandler.Enabled = true
                            localplayer.PlayerScripts.AnimalInfo.RequestHandler.Disabled = false
                        end
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
                    print("Farming Trees")
                    axeLevel = 0
                    Humanoid:UnequipTools()
                    if Backpack:FindFirstChild("Wooden Axe") then
                        Humanoid:EquipTool(Backpack["Wooden Axe"])
                        axeLevel = 1
                        axeUsing = "Wooden Axe"
                    end
                    if Backpack:FindFirstChild("Iron Axe") then
                        Humanoid:EquipTool(Backpack["Iron Axe"])
                        axeLevel = 2
                        axeUsing = "Iron Axe"
                    end
                    if Backpack:FindFirstChild("Gold Axe") then
                        Humanoid:EquipTool(Backpack["Gold Axe"])
                        axeLevel = 3
                        axeUsing = "Gold Axe"
                    end
                    if Backpack:FindFirstChild("Diamond Axe") then
                        Humanoid:EquipTool(Backpack["Diamond Axe"])
                        axeLevel = 4
                        axeUsing = "Diamond Axe"
                    end
                    if Backpack:FindFirstChild("Enchanted Axe") then
                        Humanoid:EquipTool(Backpack["Enchanted Axe"])
                        axeLevel = 5
                        axeUsing = "Enchanted Axe"
                    end
                    if axeLevel == 0 then
                        print("You need an axe to farm trees")
                        FarmTrees = false
                    end
                    if axeLevel < axeMinLevel then
                        print("You need a higher level axe to farm these trees")
                        FarmTrees = false
                    end
                    if FarmTrees then
                        print("Farming " .. treeType .. " using " .. axeUsing)
                        while FarmTrees == true do
                            for i, v in pairs(game:GetService("Workspace").Forest.SpawnPoints:GetDescendants()) do
                                if FarmTrees then
                                    if v:FindFirstChild(treeType) then
                                        -- This one is hard so I'm using a Hydroxide generated remote
                                        local ohInstance1 = v[treeType].Trunk
                                        if axeUsing == "Wooden Axe" then
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
                                        end
                                        if axeUsing == "Iron Axe" then
                                            local ohTable2 = {
                                                ["axe"] = true,
                                                ["id"] = "Iron Axe",
                                                ["stackTag"] = "axe",
                                                ["textureId"] = "rbxassetid://3603588083",
                                                ["chopStrength"] = 2,
                                                ["buyPrice"] = 1,
                                                ["cooldownWaitTime"] = 0.8,
                                                ["stackable"] = false,
                                                ["damage"] = 30
                                            }
                                        end
                                        if axeUsing == "Gold Axe" then
                                            local ohTable2 = {
                                                ["axe"] = true,
                                                ["cooldownWaitTime"] = 0.8,
                                                ["damage"] = 40,
                                                ["chopStrength"] = 3,
                                                ["id"] = "Gold Axe",
                                                ["stackable"] = false,
                                                ["stackTag"] = "axe",
                                                ["textureId"] = "rbxassetid://3655229878"
                                            }
                                        end
                                        if axeUsing == "Diamond Axe" then
                                            local ohTable2 = {
                                                ["description"] = "Testing",
                                                ["axe"] = true,
                                                ["id"] = "Diamond Axe",
                                                ["stackTag"] = "axe",
                                                ["textureId"] = "rbxassetid://3659044314",
                                                ["chopStrength"] = 4,
                                                ["stackable"] = false,
                                                ["cooldownWaitTime"] = 0.8,
                                                ["damage"] = 50
                                            }
                                        end
                                        game:GetService("ReplicatedStorage").Trees.TreeHitRequest:InvokeServer(ohInstance1, ohTable2)
                                        wait(0.1)
                                    end
                                end
                            end
                        end
                    end
                end
            end
        })

        local Dropdown = Section:Dropdown({
            Name = "Tree Type", -- String
            Items = {"Basic", "Maple", "Aspen", "Enchanted"}, -- Table
            Callback = function(item)
                treeType = item
                if treeType == "Basic" then
                    axeMinLevel = 1
                end
                if treeType == "Maple" then
                    axeMinLevel = 2
                end
                if treeType == "Aspen" then
                    axeMinLevel = 3
                end
                if treeType == "Enchanted" then
                    axeMinLevel = 4
                end
            end
        })

        local Toggle = Section:Toggle({
            Name = "Auto Fish (Go Near Your Pond)", -- String
            Default = false, -- Boolean
            Callback = function(Bool)
                AutoFish = Bool
        
                if AutoFish then
                    Humanoid:UnequipTools()
                    local found = false
                    if Backpack:FindFirstChild("Bamboo Rod") then
                        Humanoid:EquipTool(Backpack["Bamboo Rod"])
                        found = true
                    end
                    if Backpack:FindFirstChild("Fiberglass Rod") then
                        Humanoid:EquipTool(Backpack["Fiberglass Rod"])
                        found = true
                    end
                    if Backpack:FindFirstChild("Gold Rod") then
                        Humanoid:EquipTool(Backpack["Gold Rod"])
                        found = true
                    end
                    if Backpack:FindFirstChild("Diamond Rod") then
                        Humanoid:EquipTool(Backpack["Diamond Rod"])
                        found = true
                    end
                    if Backpack:FindFirstChild("Enchanted Rod") then
                        Humanoid:EquipTool(Backpack["Enchanted Rod"])
                        found = true
                    end
                    if found == false then
                        print("Please purchase a wooden rod from the shop")
                        AutoFish = false
                    end
                    while AutoFish == true do
                        game:GetService("ReplicatedStorage").Items.CastFishingRodRequest:InvokeServer(plotDir.WaterSource.CFrame)
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
            Name = "Roll Item", -- String
            Items = {"Small Egg", "Large Egg", "Cheap Furniture Box", "Quality Furniture Box"}, -- Table
            Callback = function(item)
                rollItem = item
                if rollItem == "Small Egg" then
                    rollItem = "smallPen"
                    rollPrice = 1000
                end
                if rollItem == "Large Egg" then
                    rollItem = "largePen"
                    rollPrice = 10000
                end
                if rollItem == "Cheap Furniture Box" then
                    rollItem = "cheapFurniture"
                    rollPrice = 800
                end
                if rollItem == "Quality Furniture Box" then
                    rollItem = "qualityFurniture"
                    rollPrice = 5000
                end
            end
            })

        local SmallTextbox = Section:SmallTextbox({
            Name = "Roll Amount", -- String
            Default = "Number", -- String
            Callback = function(Text)
                rollAmount = tonumber(Text)
            end
        })

        local SmallTextbox = Section:SmallTextbox({
            Name = "Get Animal", -- String
            Default = "Name", -- String
            Callback = function(Text)
                game:GetService("ReplicatedStorage").Animals.BuyAnimalRequest:InvokeServer(string.lower(Text))
            end
        })

        local Button = Section:Button({
            Name = "Dupe Sell Hand (Reload Script When Done Duping)", -- String
            Callback = function()
                game.Players.LocalPlayer.Character.Head:Destroy()
                wait(0.5)
                local connection
                connection = RunService.Stepped:Connect(function()
                    if game.Players.LocalPlayer.Character:FindFirstChild("Head") then
                        connection:Disconnect()
                    end
                    game:GetService("ReplicatedStorage").Items.SellItemRequest:InvokeServer(plotDir:WaitForChild("Bin"))
                end)
            end
        })
    end

    if gameId == 10198661638 then
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

    if gameId == 11877743732 then --unfinished
        local tycoonDir = nil
        for i, v in pairs(game:GetService("Workspace").Tycoons:GetChildren()) do
            if v.Name == pName .. " Tycoon" then
                tycoonDir = v
                print("Your tycoon is " .. tostring(tycoonDir))
            end
        end

        function getNearestZombie()
            local ClosestEnemy
            local ClosestEnemyDistance
            local ClosestEnemyPosition
            local pPos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
            for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                if v:FindFirstChild("HumanoidRootPart") then
                    if v.Humanoid.Health > 0 then
                        local a = math.abs(pPos.X - v.HumanoidRootPart.Position.X)
                        local b = math.abs(pPos.Z - v.HumanoidRootPart.Position.Z)
                        local c = math.sqrt(a^2 + b^2)
                        local d = (v.HumanoidRootPart.Position.X), (v.HumanoidRootPart.Position.Y), (v.HumanoidRootPart.Position.Z)
                        if ClosestEnemy == nil then
                            ClosestEnemy = v
                            ClosestEnemyDistance = c
                            ClosestEnemyPosition = d
                        end
                        if c < ClosestEnemyDistance then
                            ClosestEnemy = v
                            ClosestEnemyDist = c
                            ClosestEnemyPosition = d
                        end
                    end
                end
            end
        end

        local Toggle = Section:Toggle({
            Name = "Autocollect Cash", -- String
            Default = false, -- Boolean
            Callback = function(Bool)
                AutoCollect = Bool
        
                if AutoCollect then
                    if localplayer.PlayerGui.Main:FindFirstChild("CashEffect") then
                        localplayer.PlayerGui.Main.CashEffect:Destroy()
                    end
                    while AutoCollect == true do
                        firetouchinterest(HumanoidRootPart, tycoonDir.Essentials.CashCollector.Giver, 0)
                        firetouchinterest(HumanoidRootPart, tycoonDir.Essentials.CashCollector.Giver, 1)
                        wait(1)
                    end
                end
            end
        })

        local Button = Section:Button({
            Name = "Kill Nearest Zombie", -- String
            Callback = function()
                getNearestZombie()
                print(ClosestEnemy.Name)
            end
        })
    end

    if gameId == 11636413564 then
        local plotDir
        local biggestBlock = 1
        local codes = {"250likes", "Mergee", "memers", "Release"}

        for i, v in pairs(game:GetService("Workspace").Plots:GetChildren()) do
            if tostring(v.Owner.Value) == pName then
                plotDir = v
                print("You own " .. tostring(plotDir))
            end
        end

        function getBiggestBlock()
            for i, v in pairs(plotDir.Merging:GetChildren()) do
                if tonumber(v.Name) > biggestBlock then
                    biggestBlock = tonumber(v.Name)
                end
            end
        end

        function getValue(x)
            --remove '$' and ',' and '.' and 'm' from string x so that it is just a number
            x = string.gsub(x, "%$", "")
            x = string.gsub(x, ",", "")
            x = string.gsub(x, "%.", "")
            x = string.gsub(x, "m", "0000")
            x = string.gsub(x, "b", "0000000")
            return tonumber(x)
        end

        local Toggle = Section:Toggle({
            Name = "Merge Blocks", -- String
            Default = false, -- Boolean
            Callback = function(Bool)
                MergeBlocks = Bool

                if MergeBlocks then
                    while MergeBlocks == true do
                        for i, v in pairs(plotDir.Merging:GetChildren()) do
                            for i2, v2 in pairs(plotDir.Merging:GetChildren()) do
                                if v.Name == v2.Name and v ~= v2 then
                                    firetouchinterest(v, v2, 0)
                                end
                            end
                        end
                        wait(0.1)
                    end
                end
            end
        })

        local Toggle = Section:Toggle({
            Name = "Click Biggest Block", -- String
            Default = false, -- Boolean
            Callback = function(Bool)
                ClickBlocks = Bool

                if ClickBlocks then
                    while ClickBlocks == true do
                        biggestBlock = 1
                        getBiggestBlock()
                        game:GetService("ReplicatedStorage").RemoteEvents.ClickBlock:FireServer(plotDir.Merging:FindFirstChild(tostring(biggestBlock)))
                        wait(0)
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
                        if localplayer.stats.EasyObby.Value == 0 then
                            firetouchinterest(HumanoidRootPart, game:GetService("Workspace").Obbies.Easy.Win, 0)
                            firetouchinterest(HumanoidRootPart, game:GetService("Workspace").Obbies.Easy.Win, 1)
                            wait(0.1)
                        end
                        if localplayer.stats.HardObby.Value == 0 then
                            firetouchinterest(HumanoidRootPart, game:GetService("Workspace").Obbies.Hard.Win, 0)
                            firetouchinterest(HumanoidRootPart, game:GetService("Workspace").Obbies.Hard.Win, 1)
                            wait(0.1)
                        end
                        wait(1)
                    end
                end
            end
        })

        local Toggle = Section:Toggle({
            Name = "Buy Upgrades", -- String
            Default = false, -- Boolean
            Callback = function(Bool)
                BuyUpgrades = Bool
        
                if BuyUpgrades then
                    while BuyUpgrades == true do
                        if localplayer.stats.Cash.Value > tonumber(getValue(plotDir.Upgrades.LowestSpawn.SurfaceGui.Price.Text)) then
                            game:GetService("ReplicatedStorage").RemoteEvents.Upgrade:FireServer(plotDir, "LowestSpawn")
                        end
                        if localplayer.stats.Cash.Value > tonumber(getValue(plotDir.Upgrades.MaxBlocks.SurfaceGui.Price.Text)) then
                            game:GetService("ReplicatedStorage").RemoteEvents.Upgrade:FireServer(plotDir, "MaxBlocks")
                        end
                        if localplayer.stats.Cash.Value > tonumber(getValue(plotDir.Upgrades.SpawnTime.SurfaceGui.Price.Text)) then
                            game:GetService("ReplicatedStorage").RemoteEvents.Upgrade:FireServer(plotDir, "SpawnTime")
                        end
                        if localplayer.stats.Diamonds.Value > tonumber(getValue(plotDir.Upgrades.CashBoost.SurfaceGui.Price.Text)) then
                            game:GetService("ReplicatedStorage").RemoteEvents.Upgrade:FireServer(plotDir, "CashBoost")
                        end
                        if localplayer.stats.Diamonds.Value > tonumber(getValue(plotDir.Upgrades.DiamondBoost.SurfaceGui.Price.Text)) then
                            game:GetService("ReplicatedStorage").RemoteEvents.Upgrade:FireServer(plotDir, "DiamondBoost")
                        end
                        if localplayer.stats.Diamonds.Value > tonumber(getValue(plotDir.Upgrades.WorkerSlots.SurfaceGui.Price.Text)) then
                            game:GetService("ReplicatedStorage").RemoteEvents.Upgrade:FireServer(plotDir, "WorkerSlots")
                        end
                        wait(0.1)
                    end
                end
            end
        })

        local Toggle = Section:Toggle({
            Name = "Buy Workers (Honestly Workers Kinda Get In The Way)", -- String
            Default = false, -- Boolean
            Callback = function(Bool)
                BuyWorkers = Bool
        
                if BuyWorkers then
                    while BuyWorkers == true do
                        if plotDir.Helper.BillboardGui.Cost.Text ~= "MAX" then
                            if localplayer.stats.Cash.Value > tonumber(getValue(plotDir.Helper.BillboardGui.Cost.Text)) then
                                game:GetService("ReplicatedStorage").RemoteEvents.HireWorker:FireServer()
                            end
                        end
                        wait(0.1)
                    end
                end
            end
        })

        local Toggle = Section:Toggle({
            Name = "Auto Rebirth", -- String
            Default = false, -- Boolean
            Callback = function(Bool)
                AutoRebirth = Bool
        
                if AutoRebirth then
                    while AutoRebirth == true do
                        if localplayer.stats.Cash.Value > tonumber(getValue(plotDir.RebirthModel.BillboardGui.Cost.Text)) then
                            game:GetService("ReplicatedStorage").RemoteEvents.Rebirth:FireServer()
                        end
                        wait(0.1)
                    end
                end
            end
        })

        local Button = Section:Button({
            Name = "Try Codes", -- String
            Callback = function()
                for i, v in pairs(codes) do
                    game:GetService("ReplicatedStorage").RemoteEvents.Code:FireServer(v)
                end
            end
        })
    end

    if gameId == 12299415668 then

        local Toggle = Section:Toggle({
            Name = "Eat All Blocks", -- String
            Default = false, -- Boolean
            Callback = function(Bool)
                EatBlocks = Bool

                if EatBlocks then
                    while EatBlocks == true do
                        for i, v in pairs(game:GetService("Workspace").Parts:GetChildren()) do
                            if v:FindFirstChild("TouchInterest") then
                                if game:GetService("Workspace")[pName].ActualSize.Value > v.BlockSize.Value and EatBlocks then
                                    firetouchinterest(game:GetService("Workspace")[pName].HumanoidRootPart, v, 0)
                                    firetouchinterest(game:GetService("Workspace")[pName].HumanoidRootPart, v, 1)
                                end
                                wait(0)
                            end
                        end
                        wait(0)
                    end
                end
            end
        })

        local Toggle = Section:Toggle({
            Name = "Recolor Weaker Players", -- String
            Default = false, -- Boolean
            Callback = function(Bool)
                RecolorBlocks = Bool

                if RecolorBlocks then
                    while RecolorBlocks == true do
                        for i, v in pairs(game:GetService("Workspace"):GetChildren()) do
                            if v:IsA("Model") then
                                if v:FindFirstChild("HumanoidRootPart") then
                                    if v:FindFirstChild("ActualSize") then
                                        if game:GetService("Workspace")[pName].ActualSize.Value > v.ActualSize.Value then
                                            v.HumanoidRootPart.Color = Color3.fromRGB(0, 255, 0)
                                        else
                                            v.HumanoidRootPart.Color = Color3.fromRGB(255, 0, 0)
                                        end
                                    end
                                end
                            end
                        end
                        wait(0)
                    end
                end
            end
        })
    end

    if gameId == 8549934015 then
        local rarities = {"Zeniths", "Unfathomables", "Enigmatics", "Transcendents", "Exotics", "Mythics", "Surreals", "Masters", "Rares", "Uncommons", "Commons"}
        local minTier = 10
        local range = 10
        Character = game:GetService("Workspace").Debris.Plr.Swagicals
        HumanoidRootPart = Character.HumanoidRootPart
        
        local Toggle = Section:Toggle({
            Name = "Ore Snipe", -- String
            Default = false, -- Boolean
            Callback = function(Bool)
                OreSnipe = Bool
        
                if OreSnipe then
                    while OreSnipe == true do
                        for i, v in pairs(game:GetService("Workspace").Mine:GetChildren()) do
                            if v.Tier.Value <= minTier then
                                game:GetService("ReplicatedStorage").MineOre:InvokeServer(v)
                                wait(0.2) --lower works but yk i wanna avoid future detection lol
                            end
                        end
                        wait(0)
                    end
                end
            end
        })

        local Dropdown = Section:Dropdown({
            Name = "Minimum Rarity To Snipe", -- String
            Items = {"Uncommons", "Rares", "Masters", "Surreals", "Mythics", "Exotics", "Transcendents", "Enigmatics", "Unfathomables", "Zeniths"}, -- Table
            Callback = function(item)
                if item == "Uncommons" then
                    minTier = 10
                elseif item == "Rares" then
                    minTier = 9
                elseif item == "Masters" then
                    minTier = 8
                elseif item == "Surreals" then
                    minTier = 7
                elseif item == "Mythics" then
                    minTier = 6
                elseif item == "Exotics" then
                    minTier = 5
                elseif item == "Transcendents" then
                    minTier = 4
                elseif item == "Enigmatics" then
                    minTier = 3
                elseif item == "Unfathomables" then
                    minTier = 2
                elseif item == "Zeniths" then
                    minTier = 1
                end
            end
        })

        local Toggle = Section:Toggle({
            Name = "Vertical Miner", -- String
            Default = false, -- Boolean
            Callback = function(Bool)
                VerticalMiner = Bool
        
                if VerticalMiner then
                    while VerticalMiner == true do
                        local currentLevel = HumanoidRootPart.Position.Y
                        for i, v in pairs(game:GetService("Workspace").Mine:GetChildren()) do
                            if v.Position.Y > currentLevel - 1 and v.Position.Y < currentLevel + 1 then
                                local distance = (HumanoidRootPart.Position - v.Position).Magnitude
                                if distance < range and VerticalMiner then
                                    game:GetService("ReplicatedStorage").MineOre:InvokeServer(v)
                                end
                            end
                        end
                        wait(0)
                    end
                end
            end
        })

        local Toggle = Section:Toggle({
            Name = "Vertical Miner Optimized (DONT USE YET, MIGHT BAN)", -- String
            Default = false, -- Boolean
            Callback = function(Bool)
                VerticalMiner = Bool
        
                if VerticalMiner then
                    game:GetService("Workspace").Mine.ChildAdded:connect(function(child)
                        if child.Position.Y > HumanoidRootPart.Position.Y - 1 and child.Position.Y < HumanoidRootPart.Position.Y + 1 then
                            local distance = (HumanoidRootPart.Position - child.Position).Magnitude
                            if distance < range and VerticalMiner then
                                game:GetService("ReplicatedStorage").MineOre:InvokeServer(child)
                                wait(0.1)
                            end
                            if distance > range then
                                child.CanCollide = false
                                HumanoidRootPart.CFrame = CFrame.new(child.Position.X, HumanoidRootPart.Position.Y, child.Position.Z)
                                game:GetService("ReplicatedStorage").MineOre:InvokeServer(child)
                                wait(0.1)
                            end
                        end
                        if VerticalMiner == false then
                            return
                        end
                    end)
                end
            end
        })

        local Slider = Section:Slider({
            Name = "Vertical Miner Range", -- String
            Max = 1000, -- Integer
            Min = 10, -- Integer
            Default = 10, -- Integer
            Callback = function(Value)
                    range = Value
              end
        })

        Slider:SetValue(10) -- Integer

        local Button = Section:Button({
            Name = "Go To Private Server", -- String
            Callback = function()
                game:GetService("ReplicatedStorage"):WaitForChild("VIPSERVER"):FireServer(pName)
            end
        })
    end

    if gameId == 10925589760 then
        local plotDir
        local biggestBlockValue = 0
        local biggestBlock

        function getBiggestBlock()
            for i, v in pairs(plotDir.Blocks:GetChildren()) do
                if tonumber(getValue(v.Front.Number.Text)) > biggestBlockValue then
                    biggestBlockValue = tonumber(getValue(v.Front.Number.Text))
                    biggestBlock = v
                end
            end
        end

        function getValue(x)
            x = string.gsub(x, "%$", "")
            x = string.gsub(x, ",", "")
            x = string.gsub(x, "%.", "")
            x = string.gsub(x, "k", "00")
            x = string.gsub(x, "m", "00000")
            x = string.gsub(x, "b", "00000000")
            return tonumber(x)
        end

        for i, v in pairs(game:GetService("Workspace").Plots:GetChildren()) do
            if v.Name == pName then
                plotDir = v
            end
        end

        local Toggle = Section:Toggle({
            Name = "Merge Blocks", -- String
            Default = false, -- Boolean
            Callback = function(Bool)
                MergeBlocks = Bool

                if MergeBlocks then
                    while MergeBlocks == true do
                        for i, v in pairs(plotDir.Blocks:GetChildren()) do
                            for i2, v2 in pairs(plotDir.Blocks:GetChildren()) do
                                if v.Front.Number.Text == v2.Front.Number.Text and v ~= v2 then
                                    firetouchinterest(v, v2, 0)
                                end
                            end
                        end
                        wait(0)
                    end
                end
            end
        })

        local Toggle = Section:Toggle({
            Name = "Click Biggest Block", -- String
            Default = false, -- Boolean
            Callback = function(Bool)
                ClickBlocks = Bool

                if ClickBlocks then
                    while ClickBlocks == true do
                        biggestBlockValue = 0
                        getBiggestBlock()
                        game:GetService("ReplicatedStorage").Functions.Tap:FireServer(biggestBlock)
                        wait(0)
                    end
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
end
