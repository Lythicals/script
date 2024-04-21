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

--]]
--// Credits
--[[

- Thank you to @fosterobject for all the ideas & kindness (1058766950899134565)
- Thank you to @humanoidd_aa for all the help w chat and main function related stuff (1231638856957169684)

--]]
--// Variables

local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")

getgenv().owner = "Swagicals" -- Change this to the owner's username
local prefix = "?" -- Change this to whatever you want
local following = false

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
            if (Players.LocalPlayer.Character.HumanoidRootPart.Position - Players[getgenv().owner].Character.HumanoidRootPart.Position).Magnitude > 10 then
                Players.LocalPlayer.Character.Humanoid.WalkToPoint = Players[getgenv().owner].Character.HumanoidRootPart.Position
            else
                Players.LocalPlayer.Character.Humanoid.WalkToPoint = Players.LocalPlayer.Character.HumanoidRootPart.Position
            end
            task.wait()
        end
    end)
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
                if Players:FindFirstChild(string.sub(msg, 8)) then
                    chatToOwner("Owner is now ".. string.sub(msg, 8))
                    getgenv().owner = string.sub(msg, 8)
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
            else
                chatToOwner("Invalid command!")
            end
        end
    end
end)
