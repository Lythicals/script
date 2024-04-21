repeat wait() until game:IsLoaded()

--// Commands

--[[

Universal:

- summon - Teleports minion to you
- reset
- prefix [prefix]
- follow - Minion follows you
- unfollow - Minion stops following you

Da Hood:

- money [user] - Says the amount of money a user has
- dropmoney [amount] - Drops money (max 10000)
- wallet - Says the amount of money you have
- punch - Super punches

--]]

--// Credits

--[[

- Thank you to @fosterobject for all the ideas & kindness (1058766950899134565)
- Thank you to @bacon__._ for fixing my disconnect function (994898925611921458)
- Thank you to @humanoidd_aa for all the help w chat and initial function related stuff (1231638856957169684)

--]]

--// Variables for player to change

getgenv().owner = "Swagicals" -- Change this to the owner's username
local prefix = "?" -- Change this to whatever you want
local following = false
local followdist = 5
local followspeed = 16 --(default roblox speed is 16)

--// Script Variables

local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")
local debug = true

--// Functions

local function chatToOwner(msg)
    game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("/w "..getgenv().owner.." "..msg, "All")
end

local function chat(msg)
    game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(msg, "All")
end

local function follow()
    task.spawn(function()
        while following do
            if (Players.LocalPlayer.Character.HumanoidRootPart.Position - Players[getgenv().owner].Character.HumanoidRootPart.Position).Magnitude > followdist then
                Players.LocalPlayer.Character.Humanoid.WalkToPoint = Players[getgenv().owner].Character.HumanoidRootPart.Position
            else
                Players.LocalPlayer.Character.Humanoid.WalkToPoint = Players.LocalPlayer.Character.HumanoidRootPart.Position
            end
            task.wait()
        end
    end)
end

local function formatCurrency(amount)
    local value = tonumber(amount)
    if value >= 1000000000000 then
        return string.format("%.1fT", value / 1000000000000)
    elseif value >= 1000000000 then
        return string.format("%.1fB", value / 1000000000)
    elseif value >= 1000000 then
        return string.format("%.1fM", value / 1000000)
    elseif value >= 1000 then
        return string.format("%.1fK", value / 1000)
    else
        return tostring(value)
    end
end

local function daHood()
    if game.PlaceId == 2788229376 or game.PlaceId == 7213786345 then
        return true
    else
        return false
    end
end

local function getPlayer(name)
    for i,v in pairs(game:GetService("Players"):GetChildren()) do
        print(v.Name, v.DisplayName, name)
        if string.lower(v.Name) == string.lower(name) then
            return v
        elseif string.lower(v.DisplayName) == string.lower(name) then
            return v
        elseif string.sub(string.lower(v.Name), 1, string.len(name)) == string.lower(name) then
            return v
        elseif string.sub(string.lower(v.DisplayName), 1, string.len(name)) == string.lower(name) then
            return v
        end
    end
    return nil
end

--// Main

local function Stop(OnOwnerChat)
    following = false
    OnOwnerChat:Disconnect()
end


chatToOwner("Connected!")

local OnOwnerChat
OnOwnerChat = Players[getgenv().owner].Chatted:Connect(function(msg)
    if OnOwnerChat.Connected then
        if string.sub(msg, 1, 1) == prefix then
            if string.sub(msg, 1, 4) == prefix.."msg" then
                chat(string.sub(msg, 6))

            elseif msg == prefix.."summon" then
                Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Players[getgenv().owner].Character.HumanoidRootPart.CFrame

            elseif msg == prefix.."reset" then
                Players.LocalPlayer.Character.Head:Destroy()

            elseif string.sub(msg, 1, 7) == prefix.."prefix" then
                print(string.sub(msg, 9, 9))
                prefix = string.sub(msg, 9, 9)
                chatToOwner("Prefix set to "..prefix)

            elseif msg == prefix.."follow" then
                chatToOwner("Following...")
                following = true
                follow()

            elseif msg == prefix.."unfollow" then
                chatToOwner("No longer following.")
                following = false

            elseif string.sub(msg, 1, 6) == prefix.."owner" then
                if getPlayer(string.sub(msg, 8)) then
                    local player = getPlayer(string.sub(msg, 8)).Name
                    chatToOwner("Owner is now ".. player)
                    getgenv().owner = player
                    Stop(OnOwnerChat)
                else
                    chatToOwner("Invalid user!")
                end

            elseif msg == prefix.."reload" then
                chatToOwner("Reloading...")
                Stop(OnOwnerChat)
                loadstring(game:HttpGet('https://raw.githubusercontent.com/Lythicals/script/main/minion.lua'))()

            elseif msg == prefix.."rejoin" then
                --queue_on_teleport([[loadstring(game:HttpGet('https://raw.githubusercontent.com/Lythicals/script/main/minion.lua'))()]])
                game:GetService("TeleportService"):TeleportToPlaceInstance(game.placeId, game.jobId, Players.LocalPlayer)

            elseif msg == prefix.."disconnect" then
                chatToOwner("Disconnected!")
                Stop(OnOwnerChat)
            
            --// Da Hood Section

            elseif string.sub(msg, 1, 6) == prefix.."money" then
                if daHood() then
                    local user = string.sub(msg, 8)
                    if getPlayer(user) then
                        user = getPlayer(user).Name
                        chat(user.." has $"..formatCurrency(tostring(game:GetService("Players")[user].DataFolder.Currency.Value)))
                    else
                        chatToOwner("Invalid user!")
                    end
                else
                    chatToOwner("Invalid command!")
                end

            elseif string.sub(msg,1,10) == prefix.."dropmoney" then
                if daHood() then
                    amount = string.sub(msg, 12)
                    if tonumber(amount) then
                        if tonumber(amount) <= 10000 then    
                            game:GetService("ReplicatedStorage").MainEvent:FireServer("DropMoney", tonumber(amount))
                        else
                            chatToOwner("Max is 10000!")
                        end
                    else
                        chatToOwner("Invalid command!")
                    end
                end

            elseif msg == prefix.."wallet" then
                if daHood() then
                    chat("I have $"..formatCurrency(tostring(game:GetService("Players").LocalPlayer.DataFolder.Currency.Value)))
                end

            elseif msg == prefix.."punch" then
                if daHood() then
                    if not Players.LocalPlayer.Character:FindFirstChild("Combat") then
                        Players.LocalPlayer.Character.Humanoid:EquipTool(game:GetService("Players").LocalPlayer.Backpack.Combat)
                    end
                    Players.LocalPlayer.Character.Combat:Activate()
                end


            else
                chatToOwner("Invalid command!")
            end
        end
    end
end)
