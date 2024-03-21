repeat wait() until game:IsLoaded()

--[[
    ==================
         The Hunt
    ==================
    - Bike Of Hell
    - Brook Haven
    - Obby But You're On A Bike
    - Military Tycoon
    - Redcliff City
    - Legends of speed
    - Sonic Speed Simulator
    - Pet Simulator 99 [ Unoptimized ]
    - Arsenal
    - Mega Mansion Tycoon [ Buggy/Broken ]
    - Driving Empire [ no part 1 complete check so it doesnt know when to move onto part 2 ]
    - Escape Running Head
    - Snowboard Obby
    - Natural Disaster Survival
    - BARRY'S PRISON RUN OBBY!
    - Car Dealership Tycoon
    - Spray Paint
    - Tsunami Game
    - Gunfight Arena
    - The Floor Is LAVA!
    - Livetopia
    - Metro Life
    - Shindo Life
    - Mega Hide and Seek
    - Drive World
    - NEED MORE FRIENDS
    - Club Roblox
    - War Tycoon
    - Carry A Friend
    - The Mimic
    - Astro Renaissance
    - The Hunt Hub
]]

--[[
    ==================
        Objectives
    ==================
    - Fix Mega Mansion Tycoon
    - Fix Spray Paint
    - Add completed check for natural disaster
    - Add completed the first part of driving empire ( getting the eggs ) before moving onto the 3 races part
    - Improved pet simulator 99 to hatch eggs
    - Finish PLS DONATE (i dont know how to do the puzzle automatically)
    - See if there is a way to make the SCP: Roleplay script fully automatic
]]


--[[
    ==================
     Variables Section
    ==================
]]


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
local pName = localplayer.Name
local ID = game.PlaceId
local pTeam = localplayer.Team
local Backpack = localplayer.Backpack
local rootpart = game.Players.LocalPlayer.Character.HumanoidRootPart
local badgeService = game:GetService("BadgeService")

local areas = {
    "Spawn",
    "Colorful Forest",
    "Castle",
    "Green Forest",
    "Autumn",
    "Cherry Blossom",
    "Farm",
    "Backyard",
    "Misty Falls",
    "Mine",
    "Crystal Caverns",
    "Dead Forest",
    "Dark Forest",
    "Mushroom Field",
    "Enchanted Forest",
    "Crimson Forest",
    "Jungle",
    "Jungle Temple",
    "Oasis",
    "Beach"
}

--[[
    ==================
     Functions Section
    ==================
]]


function console()
    game:GetService('StarterGui'):SetCore('DevConsoleVisible', true)
    print("This script has been developed by:\n==============================\n- Gato (g.to)\n- Nono (nonfunctable)\n- Jimmy (imanewma__n)\n- Lyth (lythicals)\n- I <3 Angel (headlined)\n- Ja5on (ja5on7190)\n\nGatoHub: discord.gg/gatohub\nTerror: dsc.gg/Terrorbreakin2\n==============================")
end

function teleportTo(position)
    if localplayer.Character then
        localplayer.Character:WaitForChild("HumanoidRootPart").CFrame = position
    end
end

local function unlockArea(areaName)
    local args = { [1] = areaName }
    local success, errorMsg = pcall(function()
        game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Zones_RequestPurchase"):InvokeServer(unpack(args))
    end)
end

local function TPBestArea()
    local MapModule = require(game:GetService("ReplicatedStorage").Library.Client.ZoneCmds)
    wait() -- Add a small delay to avoid race conditions
    local bestArea = MapModule.GetMaximumZone()._script
    local zonePath = game:GetService("Workspace").Map[bestArea.Name]
    if tonumber(zonePath) and tonumber(zonePath) > 20 then
        -- print("Completed")
    else
        -- print("Incomplete")
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = zonePath.INTERACT.BREAKABLE_SPAWNS.Main.CFrame
    end
end

local function tryAllAreas()
    while true do
        for _, area in ipairs(areas) do
            unlockArea(area)
            wait(0.05) -- Add a small delay between unlocking areas
        end
        wait() -- Add a small delay before attempting to teleport to the best area again
        TPBestArea()
    end
end

--[[
    ==================
      Scripts Section
    ==================
]]

-- Bike of Hell
if ID == 14943334555 then
    console()
    print("Game Detected: Bike of Hell [HUNT🔥]")
    wait(3)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Maps.End.Light.CFrame
    print("Completed")





-- Brook Haven
elseif ID == 4924922222 then
    console()
    print("Game Detected: Brook Haven")
    fireclickdetector(workspace["EasterSign001!"].Model.Extreme.ClickDetector)
    wait(3)
    local count = 0
    local done = false
    while done == false do
        for i, v in pairs(workspace["Easter001!"].EasterEggExtreme:GetChildren()) do
            if v.EggTouched.Value == true then
                count = count + 1
            else
                firetouchinterest(v, localplayer.Character.HumanoidRootPart, 0)
                firetouchinterest(v, localplayer.Character.HumanoidRootPart, 1)
                wait(0.1)
            end
        end
        print(count .. " / 35 Eggs Collected")
        if count == 35 then
            done = true
        else 
            count = 0
        end
    end
    print("Completed")





-- Obby But You're On A Bike
elseif ID == 14184086618 then
    console()
    print("Game Detected: Obby But You're On A Bike")
    wait(3)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.WorldMap.Checkpoints["99"].Pole.CFrame
    game:GetService("TeleportService"):Teleport(14483937954, game.Players.LocalPlayer)
-- Obby But You're On A Bike 2
elseif ID == 14483937954 then
    console()
    print("Game Detected: Obby But You're On A Bike 2")
    wait(3)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.WorldMap.Checkpoints["51"].Pole.CFrame
    game:GetService("TeleportService"):Teleport(14666799841, game.Players.LocalPlayer)
-- Obby But You're On A Bike 3
elseif ID == 14666799841 then
    console()
    print("Game Detected: Obby But You're On A Bike 3")
    wait(3)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.WorldMap.Checkpoints["70"].Pole.CFrame
    game:GetService("TeleportService"):Teleport(14840620690, game.Players.LocalPlayer)
-- Obby But You're On A Bike 4
elseif ID == 14840620690 then
    console()
    print("Game Detected: Obby But You're On A Bike 4")
    wait(3)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.WorldMap.Checkpoints["70"].Pole.CFrame
    game:GetService("TeleportService"):Teleport(15321952362, game.Players.LocalPlayer)
-- Obby But You're On A Bike Race World
elseif ID == 15321952362 then
    console()
    print("Game Detected: Obby But You're On A Bike Race World")
    wait(3)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.WorldMap.Checkpoints["41"].Pole.CFrame





-- Military Tycoon
elseif ID == 7180042682 then
    console()
    print("Game Detected: Military Tycoon")
    for i, v in pairs(workspace.TheHunt:GetChildren()) do 
        fireproximityprompt(v.Hitbox.ProximityPrompt, 0)
    end
    wait(3)





-- Redcliff City
elseif ID == 8369888266 then
    console()
    print("Game Detected: Redcliff City")
    local parts = {
        [1] = workspace._QuestsContent.HUNT_2024_Quest.Collectibles[1].PrimaryPart,
        [2] = workspace._QuestsContent.HUNT_2024_Quest.Collectibles[2].PrimaryPart,
        [3] = workspace._QuestsContent.HUNT_2024_Quest.Collectibles[3].PrimaryPart,
        [4] = workspace._QuestsContent.HUNT_2024_Quest.Collectibles[4].PrimaryPart,
        [5] = workspace._QuestsContent.HUNT_2024_Quest.Collectibles[5].PrimaryPart,   
    }

    for i,v in pairs(parts) do
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
        task.wait(0.2)
        fireproximityprompt(v.ProximityPrompt)
        task.wait(1.2)
    end





-- Legends Of Speed
elseif ID == 3101667897 then
    console()
    print("Game Detected: Legends Of Speed")
    while (game.RunService.Stepped:Wait()) do
        for _,v in ipairs(workspace:FindFirstChild("Hoops"):GetChildren()) do
            firetouchinterest(localplayer.Character.HumanoidRootPart, v, 0)
            firetouchinterest(localplayer.Character.HumanoidRootPart, v, 1)
        end
    end





-- Sonic Speed Simulator
elseif ID == 9049840490 then
    console()
    print("Game Detected: Sonic Speed Simulator")
    game:GetService("ReplicatedStorage").Knit.Services.MapStateService.RE.OnStateAction:FireServer("AddEventPodiumProgress","CollectTimeStones",100)





-- Pet Simulator 99
elseif ID == 8737899170 then
    console()
    print("Game Detected: Pet Simulator 99 Normal World")
    print("[!]===[!]\nWARNING: YOU NEED DECENT PETS FOR THIS!")
    tryAllAreas()
elseif ID == 16498369169 then
    console()
    print("Game Detected: Pet Simulator 99 Tech World")
    print("Completed")





-- Arsenal
elseif ID == 286090429 then
    console()
    print("Game Detected: Arsenal")
    wait(3)
    game:GetService("TeleportService"):Teleport(391595633, game.Players.LocalPlayer)
elseif ID == 391595633 then
    console()
    print("Game Detected: Arsenal Hunt")
    wait(3)
    loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/6553ac46bc1e213a162a94b302473f3c.lua"))()
    print("Credits to Bolt")





-- Mega Mansion Tycoon
elseif ID == 8328351891 then
    console()
    print("Game Detected: Mega Mansion Tycoon")
    local done = false
    
    game:GetService("Players").LocalPlayer.PlayerGui.UI:FindFirstChild('Store'):Destroy()

    coroutine.wrap(function()
        while task.wait() do
            print(done)
            if (game:GetService("Players").LocalPlayer.PlayerGui.UI.TheHunt.Quest.ProgressFrame.markers["4"].CompletedEgg.ImageTransparency) == 0 then
                done = true
                
                task.wait(1)
                -- Script generated by SimpleSpy - credits to exx#9394

                local args = {
                    [1] = "Book"
                }
                
                game:GetService("ReplicatedStorage").RemoteEvents.LocationTeleport:FireServer(unpack(args))

                task.wait(1)
                for i = 1, 5 do
                    -- Simulate pressing the E key
                    game:GetService("UserInputService"):SendKeyEvent(true, Enum.KeyCode.E, false, game)
                    task.wait(0.25)
                end
            end
        end
    end)()

    coroutine.wrap(function()
        local m = Instance.new("Message", workspace)
        m.Text = "I'm so sorry this autofarm is painfully slow."
        task.wait(5)
        m:Destroy()
    end)()

    local function getTeam()
        for _,v in ipairs(workspace["Zednov's Tycoon Kit"].Tycoons:GetChildren()) do
            if tostring(v.Owner.Value) == game.Players.LocalPlayer.Name then
                return v.Name
            end
        end
    end

    coroutine.wrap(function()
        while (task.wait()) do
            if not done then
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, workspace["Zednov's Tycoon Kit"].Tycoons[getTeam()].Essentials.Giver, 0)
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, workspace["Zednov's Tycoon Kit"].Tycoons[getTeam()].Essentials.Giver, 1)   
            end
        end
    end)()

    while (task.wait()) do
        if not done then
            xpcall(function()
                if workspace["Zednov's Tycoon Kit"].Tycoons:FindFirstChild(getTeam()) then
                    for _,v in ipairs(workspace["Zednov's Tycoon Kit"].Tycoons[getTeam()]:FindFirstChild("Buttons").Level1:GetChildren()) do
                        if (v:FindFirstChild("Head"):FindFirstChild("TouchInterest")) then
                            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v:WaitForChild("Head"), 0)
                            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v:WaitForChild("Head"), 1)

                            task.wait()
                        end    
                    end
                end    
            end, function()
                if workspace["Zednov's Tycoon Kit"].Tycoons:FindFirstChild(getTeam()) then
                    for _,v in ipairs(workspace["Zednov's Tycoon Kit"].Tycoons[getTeam()]:FindFirstChild("Buttons").Level1:GetChildren()) do
                        if (v:FindFirstChild("Head"):FindFirstChild("TouchInterest")) then
                            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v:WaitForChild("Head"), 0)
                            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v:WaitForChild("Head"), 1)

                            task.wait()
                        end    
                    end
                end
            end)
        end
    end





-- Driving Empire
elseif ID == 3351674303 then
    console()
    print("Game Detected: Driving Empire")

    -- Part 1
    while wait() do
        pcall(function()
            for _, token in pairs(workspace.Game.TheHuntTokens:GetChildren()) do
                if token.ClassName == "Model" and token.Decoration.CollectionRing.Main.Transparency ~= 1 then
                    local dist = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - token.WorldPivot.Position).magnitude
                    local CFrameEnd = token.WorldPivot
                    local Time = dist / 500
                    local tween = game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(Time), {CFrame = CFrameEnd})
                    tween:Play()
                    tween.Completed:Wait()
                end
            end
        end)
    end

    -- SOMEONE ADD FINISHED FIRST PART 1 CHECK
    -- Part 2
    getfenv().autorace = true
    local args = {
        [1] = "Spawn",
        [2] = "Roadster1"
    }
    
    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("VehicleEvent"):FireServer(unpack(args))
    for _ = 1, 3 do
        wait()

        local targets = {Vector3.new(-5829.25244140625, 13.172981262207031, -4547.52734375),
                        Vector3.new(-6042.875, 13.167439460754395, -4419.7880859375),
                        Vector3.new(-7208.626953125, 17.2252140045166, -3878.749267578125),
                        Vector3.new(-7480.05029296875, 17.030288696289062, -4023.354248046875),
                        Vector3.new(-7499.04833984375, 16.86574935913086, -4260.5849609375),
                        Vector3.new(-7053.859375, 95.45365905761719, -5047.7353515625),
                        Vector3.new(-6933.01513671875, 103.28064727783203, -5273.7802734375),
                        Vector3.new(-7038.1328125, 102.24063110351562, -5418.88134765625),
                        Vector3.new(-7411.20166015625, 104.01030731201172, -5527.62744140625),
                        Vector3.new(-7562.5078125, 103.13227081298828, -5353.17529296875),
                        Vector3.new(-7510.0400390625, 113.12329864501953, -5041.650390625),
                        Vector3.new(-7554.18115234375, 121.06523895263672, -4750.27978515625),
                        Vector3.new(-8003.521484375, 121.02157592773438, -4670.95849609375),
                        Vector3.new(-8366.4267578125, 121.08616638183594, -4802.146484375),
                        Vector3.new(-8366.4267578125, 121.08616638183594, -4802.146484375),
                        Vector3.new(-8904.380859375, 121.06612396240234, -5314.16943359375),
                        Vector3.new(-9220.4892578125, 112.66061401367188, -5333.4736328125),
                        Vector3.new(-9699.6650390625, 98.95747375488281, -5349.125),
                        Vector3.new(-9974.1064453125, 107.31916046142578, -5327.49169921875),
                        Vector3.new(-10100.287109375, 134.202880859375, -4888.4189453125),
                        Vector3.new(-10269.755859375, 145.26913452148438, -4765.216796875),
                        Vector3.new(-11117.45703125, 164.49066162109375, -4820.31982421875),
                        Vector3.new(-11267.1318359375, 159.88140869140625, -4978.9736328125),
                        Vector3.new(-11216.248046875, 149.27423095703125, -5151.31787109375),
                        Vector3.new(-10848.41015625, 124.27227783203125, -5437.7705078125),
                        Vector3.new(-10485.3447265625, 80.56782531738281, -6160.67822265625),
                        Vector3.new(-10224.416015625, 114.88748931884766, -6661.13134765625),
                        Vector3.new(-9979.40625, 126.98040771484375, -6850.55078125),
                        Vector3.new(-9371.0498046875, 124.6066665649414, -7120.89453125),
                        Vector3.new(-9143.7060546875, 124.38055419921875, -7014.615234375),
                        Vector3.new(-8909.880859375, 124.72514343261719, -6758.13037109375),
                        Vector3.new(-8420.248046875, 125.99227905273438, -6079.4228515625),
                        Vector3.new(-8472.7021484375, 127.7784652709961, -5658.3662109375),
                        Vector3.new(-8319.564453125, 128.29640197753906, -5549.84423828125),
                        Vector3.new(-7931.5263671875, 142.41270446777344, -5813.2421875),
                        Vector3.new(-7856.5341796875, 125.91947937011719, -6057.98583984375),
                        Vector3.new(-8329.6845703125, 115.09233856201172, -6525.8408203125),
                        Vector3.new(-8401.833984375, 102.71997833251953, -6785.6318359375),
                        Vector3.new(-8342.2041015625, 87.89356231689453, -7265.3076171875),
                        Vector3.new(-8200.9140625, 80.74073791503906, -7357.69921875),
                        Vector3.new(-7256.15087890625, 46.925262451171875, -7734.26220703125),
                        Vector3.new(-7075.7890625, 50.094905853271484, -7585.05322265625),
                        Vector3.new(-7014.78759765625, 52.57841110229492, -6936.11865234375),
                        Vector3.new(-7328.11376953125, 13.152870178222656, -6250.494140625),
                        Vector3.new(-7217.23486328125, 13.168482780456543, -6049.95703125),
                        Vector3.new(-6585.333984375, 13.155198097229004, -5658.6669921875),
                        Vector3.new(-6132.30517578125, 13.15969467163086, -5221.6025390625),
                        Vector3.new(-5795.2197265625, 13.177273750305176, -5237.55419921875),
                        Vector3.new(-5509.1787109375, 13.15958023071289, -5330.7958984375),
                        Vector3.new(-5455.10791015625, 13.169073104858398, -5511.26708984375),
                        Vector3.new(-5707.73828125, 13.165904998779297, -6068.2705078125),
                        Vector3.new(-5655.29541015625, 13.155265808105469, -6302.83984375),
                        Vector3.new(-5405.869140625, 13.16794204711914, -6480.95751953125),
                        Vector3.new(-5103.0537109375, 13.157496452331543, -6430.4111328125),
                        Vector3.new(-4922.5390625, 13.173261642456055, -6135.64453125),
                        Vector3.new(-5004.60205078125, 13.160365104675293, -5773.85546875),
                        Vector3.new(-5232.853515625, 13.151106834411621, -5339.408203125)}

        if #workspace.Game.Races.LocalSession:GetChildren() == 0 then
            game:GetService("ReplicatedStorage").Remotes.RaceStartTimeTrial:FireServer("Circuit", "PlayerBest")

            repeat
                wait()
            until game:GetService("Players").LocalPlayer.PlayerGui.MainHUD.Countdown:FindFirstChild("GO")

        elseif #workspace.Game.Races.LocalSession:GetChildren() > 0 and game:GetService("Players").LocalPlayer.PlayerGui.MainHUD.RaceInfo.Visible == true and game:GetService("Players").LocalPlayer.PlayerGui.MainHUD.RaceInfo.Time.Text ~= "0:00.000" then
            local chr = game.Players.LocalPlayer.Character
            local car = chr.Humanoid.SeatPart.Parent

            for _, target in ipairs(targets) do
                if #workspace.Game.Races.LocalSession:GetChildren() > 0 then
                    repeat
                        task.wait()

                        local mathlock = getfenv().speed or 300
                        car.PrimaryPart.Velocity = car.PrimaryPart.CFrame.LookVector * mathlock
                        car:PivotTo(CFrame.new(car.PrimaryPart.Position, target))
                    until game.Players.LocalPlayer:DistanceFromCharacter(target) < 30 or not getfenv().autorace or #workspace.Game.Races.LocalSession:GetChildren() == 0
                end
            end
        end
    end

    print("Completed")






-- Escape Running Head 1
elseif ID == 6205205961 then
    console()
    print("Game Detected: Escape Running Head 1")
    rootpart.CFrame = workspace.Folder.Model.HitBox.CFrame
    wait(2)
    queue_on_teleport(loadstring(game:HttpGet("https://raw.githubusercontent.com/Lythicals/script/main/autohunt.lua"))())
    game:GetService("TeleportService"):Teleport(6364879587, game.Players.LocalPlayer)
    -- Escape Running Head 2
elseif ID == 6364879587 then
    console()
    print("Game Detected: Escape Running Head 2")
    rootpart.CFrame = workspace.Model.HitBox.CFrame
    wait(2)
    game:GetService("TeleportService"):Teleport(6364881161, game.Players.LocalPlayer)
-- Escape Running Head 3
elseif ID == 6364881161 then
    console()
    print("Game Detected: Escape Running Head 3")
    rootpart.CFrame = workspace.Model.HitBox.CFrame
    wait(2)
    print("Completed")




-- Snowboard Obby
elseif ID == 15479016377 then
    console()
    print("Game Detected: Snowboard Obby")
    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("EasterEventRE"):FireServer("StartEasterTask")
    while not badgeService:UserHasBadgeAsync(localplayer.UserId, 3183430629084179) do
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("GamePlayerRE"):FireServer("ResetAllPassLevel")
        wait(0.5)
        teleportTo(workspace.Map["Level-1 Easy"]["01"].SavePoint.SpawnLocation.CFrame)
        wait(0.1)
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("EasterEventRE"):FireServer("ClaimEasterTaskReward")
        wait()
    end
    print("Completed")





-- Natural Disaster Survival
elseif ID == 189707 then
    console()
    print("Game Detected: Natural Disaster Survival")
    while true do
        for i, v in pairs(workspace.Clocks:GetChildren()) do
            if v then
                v.ClaimEvent:FireServer()
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace["Event Station"]["Unfinished Character"].Machine.Surface.CFrame
            end
        end
        wait(2.5)
        print("Waiting for game to start..")
    end


    


-- BARRY'S PRISON RUN OBBY!
elseif ID == 8712817601 then
    console()
    print("Game Detected: BARRY'S PRISON RUN OBBY!")
    Character.HumanoidRootPart.CFrame = CFrame.new(-1014, 72, -155)
    wait(0.1)
    Character.HumanoidRootPart.CFrame = CFrame.new(-539, 43, 48)
    wait(0.1)
    Character.HumanoidRootPart.CFrame = CFrame.new(-1932, 953, -709)
    wait(0.1)
    Character.HumanoidRootPart.CFrame = CFrame.new(-257, 8, -44)
    wait(0.1)
    Character.HumanoidRootPart.CFrame = CFrame.new(65, 103, -120)
    wait(0.1)
    Character.HumanoidRootPart.CFrame = CFrame.new(-51, 78, -70)
    wait(0.1)
    Character.HumanoidRootPart.CFrame = CFrame.new(-62, 103, -167)
    wait(0.1)
    Character.HumanoidRootPart.CFrame = CFrame.new(-626, 205, 70)
    wait(0.1)
    Character.HumanoidRootPart.CFrame = CFrame.new(-878, 226, -219)
    wait(0.1)
    Character.HumanoidRootPart.CFrame = CFrame.new(-68, 99, -26)
    wait(1)
    print("Completed")





-- Car Dealership Tycoon
elseif ID == 1554960397 then
    console()
    print("Game Detected: Car Dealership Tycoon")
    while task.wait() do
        local hasBunnies = false
        for _, v in pairs(workspace.BunnyHunt:GetDescendants()) do
            if v.Name == "Bunny" and v.Transparency ~= 1 then
                hasBunnies = true
                repeat
                    task.wait()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
                    local args = {
                        [1] = workspace:WaitForChild("BunnyHunt"):WaitForChild(v.Parent.Name):WaitForChild("Part")
                    }
    
                    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Collectibles"):WaitForChild("TryToCollect"):FireServer(unpack(args))
                until v.Transparency == 1
            end
        end
        if not hasBunnies then
            print("Completed")
            break
        end
    end





-- Spray Paint
elseif ID == 5991163185 then
    console()
    print("Game Detected: Spray Paint")
    game:GetService("ReplicatedStorage"):WaitForChild("EggHuntRemote"):InvokeServer("AwardBadge")
    print("Completed")





-- Tsunami Game
elseif ID == 7993293100 then
    console()
    print("Game Detected: Tsunami Game")
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.ScriptImportance.AlienShop.CFrame
    print("Completed")





-- Gunfight Arena
elseif ID == 14518422161 then
    console()
    print("Game Detected: Gunfight Arena")
    print("Please wait until it's finished!")
    while not badgeService:UserHasBadgeAsync(localplayer.UserId, 3038128691832836) do
        for i, v in pairs(workspace.Walls:GetChildren()) do
            if v.Name == 'Burger' then
                print("Collecting Burger")
                if Character.HumanoidRootPart then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
                end
                wait(0.1)
            end
            if v.Name == 'Pizza' then
                print("Collecting Pizza")
                if Character.HumanoidRootPart then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
                end
                wait(0.1)
            end
            if v.Name == 'Coil' then
                print("Collecting Coil")
                if Character.HumanoidRootPart then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
                end
                wait(0.1)
            end
            if v.Name == 'Sword' then
                print("Collecting Sword")
                if Character.HumanoidRootPart then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
                end
                wait(0.1)
            end
            if v.Name == 'Cream' then
                print("Collecting Cream")
                if Character.HumanoidRootPart then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
                end
                wait(0.1)
            end
        end
        wait(1)
    end
    print("Player has badge 3038128691832836")
    print("Completed")
    
    


-- The Floor Is LAVA!
elseif ID == 815405518 then
    console()
    print("Game Detected: The Floor Is LAVA!")
    game:GetService("ReplicatedStorage").Remotes.AwardEvent2:FireServer()
    print("Completed")




    
-- PLS DONATE
elseif ID == 8737602449 then
    console()
    print("Game Detected: PLS DONATE")
    teleportTo(workspace.TheHunt.OldMan.HumanoidRootPart.CFrame)
    wait(1)
    fireproximityprompt(workspace.TheHunt.OldMan.ProximityPrompt)
    print("Wait for old man to stop yapping...")
    wait(40)
    teleportTo(workspace.Map.NukeIsland.NukePlatform.SetUp.Screen.CFrame)
    wait(1)
    fireproximityprompt(workspace.Map.NukeIsland.NukePlatform.SetUp.KeyboardMouse.AccessoryPart.ProximityPrompt)
    wait(1)
    --[[
    while workspace.NetPuzzle do
        for i, v in pairs(workspace.NetPuzzle:GetDescendants()) do
            if v.Name == "Hitbox" then
                local num = math.random(1, 2)
                if num == 1 then
                    fireclickdetector(v.ClickDetector)
                end
            end
        end
        wait(0)
    end
    ]]
    print("Completed")





-- Livetopia
elseif ID == 6737970321 then
    console()
    print("Game Detected: Livetopia")
    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("EquipToolRF"):InvokeServer("Easter2024_Egg", "Equip")
    game.Players.LocalPlayer.Character.Easter2024_Egg:Activate()
    print("Completed")   





-- Metro Life
elseif ID == 12985361032 then
    console()
    print("Game Detected: Metro Life")
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-100.086655, 64.9068298, 445.216217, 0.999769151, 2.36360318e-08, -0.0214847606, -2.38997746e-08, 1, -1.20190133e-08, 0.0214847606, 1.25297195e-08, 0.999769151)
    task.wait(0.5)
    local vim = game:GetService('VirtualInputManager')
    vim:SendKeyEvent(true, Enum.KeyCode.E, false, nil)
    task.wait(0.005)
    vim:SendKeyEvent(false, Enum.KeyCode.E, false, nil)
    task.wait(1)
    vim:SendKeyEvent(true, Enum.KeyCode.E, false, nil)
    task.wait(0.005)
    vim:SendKeyEvent(false, Enum.KeyCode.E, false, nil)
    task.wait(0.5)
    vim:SendKeyEvent(true, Enum.KeyCode.Space, false, game)
    task.wait(0.005)
    vim:SendKeyEvent(false, Enum.KeyCode.Space, false, game)
    task.wait(0.5)

    task.spawn(function()
        while task.wait(5) do
            game:GetService("StarterGui"):SetCore("SendNotification",{
                Title = "Important!",
                Text = "Keep executing script until you get the badge, don't spam execute.",
                Icon = "rbxassetid://1234567890"
            })
        end
    end)

    task.spawn(function()
        while task.wait() do
            for _, v in ipairs(workspace:FindFirstChild("ART_City"):FindFirstChild("CityEnv"):FindFirstChild("RPBuilding"):FindFirstChild("BallonView"):FindFirstChild("EasterLine1"):FindFirstChild("On"):FindFirstChild("EasterLine"):GetChildren()) do
                if v:IsA("Part") and v:GetAttribute("On") == true then
                    repeat 
                        task.wait()
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
                    until v:GetAttribute("On") == false
                    task.wait(0.5)
                end
            end
        end
    end)

    task.spawn(function()
        while task.wait() do
            local args = {
                [1] = "ClaimReward"
            }
        
            game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("TheHuntRF"):InvokeServer(unpack(args))
        end
    end)





-- Shindo Life: Main Game
elseif ID == 4616652839 then
    console()
    print("Game Detected: Shindo Life Main")
    game:GetService("TeleportService"):Teleport(16701824804, game.Players.LocalPlayer)
-- Shindo Life: Hunt Game
elseif ID == 16701824804 then
    console()
    print("Game Detected: Shindo Life Hunt")
    for _, v in pairs(workspace.EggEvent.eggs:GetDescendants()) do
        if v:IsA("TouchTransmitter") and v.Parent then
            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Parent, 0)
            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Parent, 1)
        end
    end
    print("Completed")

-- Mega Hide and Seek
elseif ID == 5708035517 then
    local RunService = game:GetService("RunService")

    local function teleportCharacter()
        local player = game.Players.LocalPlayer
        local character = player.Character
        local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
        
        if humanoidRootPart then
            humanoidRootPart.CFrame = CFrame.new(Vector3.new(0, 500, 0))
        end
    end
    
    RunService.Stepped:Connect(teleportCharacter)

-- Drive World
elseif ID == 10704789056 then
    while wait() do
        local plr = game.Players.LocalPlayer
        local chr = plr.Character
        local car = chr.Humanoid.SeatPart.Parent.Parent
        if not car:FindFirstChild("Trailer") then
        game:GetService("ReplicatedStorage").Systems.Objects.Members.TrailerSpawn.GetTrailer:FireServer("HuntTrailer", game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
        repeat wait()
        until  car:FindFirstChild("Trailer")
        repeat wait()
        until workspace:findFirstChild("CompletionRegion")
        end
        repeat task.wait()
        if workspace:findFirstChild("CompletionRegion") then
        local plr = game.Players.LocalPlayer
        local chr = plr.Character
        local car = chr.Humanoid.SeatPart.Parent.Parent
        car:PivotTo(workspace.CompletionRegion.Primary.CFrame*CFrame.new(0,0,-10))
        car.Trailer:PivotTo(workspace.CompletionRegion.Primary.CFrame)
        end
        until not workspace:findFirstChild("CompletionRegion")
        repeat wait()
        until workspace.BuildACar:findFirstChild("EventSphere")
        local plr = game.Players.LocalPlayer
        local chr = plr.Character
        local car = chr.Humanoid.SeatPart.Parent.Parent
        car:PivotTo(workspace.BuildACar.EventSphere.CFrame)
        wait(1)
        car.PrimaryPart.Velocity = Vector3.new(0,0,0)
        for i,v in pairs(workspace.Destructible:GetChildren()) do
        if string.find(v.Name,"Junk_ScrapCrate") and v:FindFirstChild("Render") and v:FindFirstChild("Render").WorldPivot.Y >0 or string.find(v.Name,"Junk_Hooligan") and v:FindFirstChild("Render") and v:FindFirstChild("Render").WorldPivot.Y >0 then
        car:PivotTo(v:FindFirstChild("Render").WorldPivot+Vector3.new(0,50,0))
        car.PrimaryPart.Velocity = car.PrimaryPart.CFrame.UpVector*-200
        wait(0.5)
        break
        end
        end
        if workspace:findFirstChild("CompletionRegion") then
        repeat task.wait()
        if workspace:findFirstChild("CompletionRegion") then
        car:PivotTo(workspace.CompletionRegion.Primary.CFrame*CFrame.new(0,0,-10))
        car.Trailer:PivotTo(workspace.CompletionRegion.Primary.CFrame)
        end
        until not workspace:findFirstChild("CompletionRegion")
        end
    end 





-- NEED MORE FRIENDS
elseif ID == 16445368294 then
    console()
    print("Game Detected: NEED MORE FRIENDS")
    teleportTo(workspace.EVENTMAIN.Doors.EndDoor.Light.CFrame)
    wait(3)
    fireproximityprompt(workspace.WINNER.MAIN.ProximityPrompt)
    print("Completed")





-- SCP: Roleplay
elseif ID == 5041144419 then
    Game:GetService("ReplicatedStorage").Remotes.Update:FireServer("<SCP-093 Mission")
elseif ID == 6939657427 then
    if workspace:FindFirstChild("House") == nil then
        Game:GetService("ReplicatedStorage").Remotes.Update:FireServer("<SCP-093 Mission")
        wait(10)
    end
    console()
    print("Game Detected: SCP: Roleplay")
    print("Opening Bunker Door 1...")
    Character.HumanoidRootPart.CFrame = CFrame.new(-326, -8, 343)
    wait(1)
    game:GetService("ReplicatedStorage"):WaitForChild("Event"):FireServer("Bunker Door 1")
    wait(0.1)
    Character.HumanoidRootPart.CFrame = CFrame.new(-325, -8, 312)
    wait(1)
    game:GetService("ReplicatedStorage"):WaitForChild("Event"):FireServer("Electrical Box 1")
    wait(0.1)
    Character.HumanoidRootPart.CFrame = CFrame.new(-326, -8, 343)
    wait(1)
    game:GetService("ReplicatedStorage"):WaitForChild("Event"):FireServer("Bunker Door 1")
    wait(0.1)
    print("Opening Bunker Door 2...")
    Character.HumanoidRootPart.CFrame = CFrame.new(-220, -8, 315)
    wait(1)
    game:GetService("ReplicatedStorage"):WaitForChild("Event"):FireServer("Electrical Box 2")
    wait(0.1)
    Character.HumanoidRootPart.CFrame = CFrame.new(-222, -8, 339)
    wait(1)
    game:GetService("ReplicatedStorage"):WaitForChild("Event"):FireServer("Bunker Door 2", workspace.Bunker.Code.RandomizedCode.SurfaceGui.Code.Text)
    wait(5)
    Character.HumanoidRootPart.CFrame = CFrame.new(229, 40, 131)
    print("Breaking Nearby Door(s)...")
    wait(1)
    for i, v in pairs(workspace.House.Doors:GetChildren()) do
        game:GetService("ReplicatedStorage"):WaitForChild("Event"):FireServer("Breakable Door", v)
    end
    wait(1)
    Character.HumanoidRootPart.CFrame = CFrame.new(252, 46, 86)
    wait(0.1)
    Humanoid:EquipTool(game.Players.LocalPlayer.Backpack:FindFirstChild("Glock 17"))
    print("Please shoot the stairs for the script to continue.")
    repeat wait() until workspace.House.Interactions:FindFirstChild("Stairs Barrier") == nil
    Character.HumanoidRootPart.CFrame = CFrame.new(271, 53, 122)
    print("Breaking Nearby Door(s)...")
    wait(1)
    for i, v in pairs(workspace.House.Doors:GetChildren()) do
        game:GetService("ReplicatedStorage"):WaitForChild("Event"):FireServer("Breakable Door", v)
    end
    wait(1)
    game:GetService("ReplicatedStorage"):WaitForChild("Event"):FireServer("Electrical Box 3")
    wait(0.1)
    Character.HumanoidRootPart.CFrame = CFrame.new(258, 14, 114)
    wait(1)
    print("Breaking Nearby Door(s)...")
    for i, v in pairs(workspace.House.Doors:GetChildren()) do
        game:GetService("ReplicatedStorage"):WaitForChild("Event"):FireServer("Breakable Door", v)
    end
    wait(1)
    Character.HumanoidRootPart.CFrame = CFrame.new(255, 14, 143)
    wait(3)
    game:GetService("ReplicatedStorage"):WaitForChild("Event"):FireServer("Relic")
    wait(5)
    teleportTo(workspace.Bunker.Mirror.Mirror.Part.CFrame)
    print("Completed")
    
    



-- Club Roblox
elseif ID == 3457390032 then
    Game:GetService("ReplicatedStorage").ReplicatedTeleport.RemoteEvents.remoteTeleport:FireServer("T079")
elseif ID == 16711937403 then
    console()
    print("Game Detected: Club Roblox")
    Character.HumanoidRootPart.CFrame = CFrame.new(-760.850159, 100.5, 13.9999866)
    wait(2)
    Character.HumanoidRootPart.CFrame = CFrame.new(2187.05005, 122.5, -10.4999704)
    wait(2)
    Character.HumanoidRootPart.CFrame = CFrame.new(287.25, 165.5, 15)
    wait(2)
    Character.HumanoidRootPart.CFrame = CFrame.new(478.749939, 100.5, -17.5000305)
    wait(2)
    Character.HumanoidRootPart.CFrame = CFrame.new(690.25, 121.5, 33)
    wait(2)
    Character.HumanoidRootPart.CFrame = CFrame.new(687, 111, 253)
    print("Press e when ready and collect the badge!")





-- War Tycoon
elseif ID == 4639625707 then
    console()
    print("Game Detected: War Tycoon")
    Character.HumanoidRootPart.CFrame = CFrame.new(71, 101, 189) --Rendering Crates
    wait(0.1)
    for i, v in pairs(workspace["Game Systems"]["UGC Crates"]:GetChildren()) do
        teleportTo(v["UGC Crate"].CFrame)
        wait(1)
        fireproximityprompt(v["UGC Crate"].CollectUGC)
        wait(0.2)
        Character.HumanoidRootPart.CFrame = CFrame.new(71, 101, 189) --Rendering Crates
        wait(0.2)
    end
    print("Completed")





-- Carry A Friend
elseif ID == 14448662003 then
    game:GetService("TeleportService"):Teleport(15520513462, game.Players.LocalPlayer)
elseif ID == 15520513462 then
    console()
    print("Game Detected: Carry A Friend")
    for i, v in pairs(workspace["2 Player:"]["Level 14: The Hunt"]["Egg Locations"].Locations:GetChildren()) do
        print("Collecting " .. v.Name)
        for j = 1, 5 do
            Character.HumanoidRootPart.CFrame = v.CFrame
            fireproximityprompt(v.ProximityPrompt)
            wait(0.1)
        end
    end
    wait(0.2)
    if workspace["2 Player:"]["Level 14: The Hunt"].LevelCheck:FindFirstChild("RotCaptchaCheck") then
        workspace["2 Player:"]["Level 14: The Hunt"].LevelCheck.RotCaptchaCheck:Destroy()
    end
    teleportTo(workspace["2 Player:"]["Level 14: The Hunt"].Jumps.ToLobby.CFrame)
    wait(2)
    print("Collecting failed, please get a partner and try again!")





-- The Mimic
elseif ID == 6243699076 then
    game:GetService("TeleportService"):Teleport(16750505007, game.Players.LocalPlayer)
elseif ID == 16750505007 then
    console()
    print("Game Detected: The Mimic")
    if badgeService:UserHasBadgeAsync(localplayer.UserId, 1832660142626803) then
        print("Badge owned, collecting gold. Feel free to rerun the script to collect more gold.")
    end
    repeat
        for i, v in pairs(workspace.TheEvent.Eggs:GetChildren()) do
            teleportTo(v.CFrame)
            wait(0.2)
            if v:FindFirstChild("ProximityPrompt") then
                fireproximityprompt(v.ProximityPrompt)
            end
            firetouchinterest(workspace.TheEvent.SellSpots:FindFirstChild("Sell"),localplayer.Character.HumanoidRootPart,0)
            firetouchinterest(workspace.TheEvent.SellSpots:FindFirstChild("Sell"),localplayer.Character.HumanoidRootPart,1)
        end
        game:GetService("ReplicatedStorage"):WaitForChild("TheHunt"):WaitForChild("TheMarket"):InvokeServer(1)
    until badgeService:UserHasBadgeAsync(localplayer.UserId, 1832660142626803)
    print("Completed")





-- Astro Renaissance
elseif ID == 11329389795 then
    game:GetService("TeleportService"):Teleport(16700725713, game.Players.LocalPlayer)
elseif ID == 16700725713 then
    console()
    print("Game Detected: Astro Renaissance")
    game:GetService("ReplicatedStorage").QuestAssets.MainEvent:FireServer("FinishMoonlight")
    print("Completed")





-- Place Not Recognized
else
    print("Unknown PlaceId:", ID)
end

--// End
