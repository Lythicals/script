repeat wait() until game:IsLoaded()

-- my minion script :)

--// Commands
--[[

Universal:

- summon - Teleports minion to you
- reset
- prefix [prefix]
- follow - Minion follows you
- unfollow - Minion stops following you

Da Hood:

- money [user] - Shows the amount of money a user has

--]]
--// Credits
--[[

- Thank you to @fosterobject for all the ideas & kindness (1058766950899134565)
- Thank you to @humanoidd_aa for all the help w chat and main function related stuff (1231638856957169684)

--]]
--// Variables

getgenv().owner = 'Swagicals'
local prefix = '?'
local WhisperToOwner = game:GetService('RobloxReplicatedStorage').ExperienceChat.WhisperChat:InvokeServer(game.Players[owner].UserId)
WhisperToOwner:SendAsync("Connected!")
local following = false
local previousstate = nil

--// Functions

local function chatToOwner(msg)
    WhisperToOwner:SendAsync(msg)
end

local function chat(msg)
    game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync(msg)
end

local function stop()
    following = false
    OnOwnerChat:Disable()
    OnOwnerChat:Disconnect()
end

local function follow()
    coroutine.wrap(function()
        while following do
            if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - game.Players[getgenv().owner].Character.HumanoidRootPart.Position).Magnitude > 10 then
                game.Players.LocalPlayer.Character.Humanoid.WalkToPoint = game.Players[getgenv().owner].Character.HumanoidRootPart.Position
            else
                game.Players.LocalPlayer.Character.Humanoid.WalkToPoint = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
            end
            wait()
        end
    end)()
end

--// Setup



--// Main

local OnOwnerChat
OnOwnerChat = game.Players[getgenv().owner].Chatted:Connect(function(msg)
    if OnOwnerChat.Connected then
        if string.sub(msg, 1, 1) == prefix then
            if string.sub(msg, 1, 4) == prefix.."msg" then
                chat(string.sub(msg, 6))

            elseif msg == prefix.."summon" then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[getgenv().owner].Character.HumanoidRootPart.CFrame

            elseif msg == prefix.."reset" then
                game.Players.LocalPlayer.Character.Head:Destroy()

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
                if game.Players:FindFirstChild(string.sub(msg, 8)) then
                    chatToOwner("Owner is now ".. string.sub(msg, 8))
                    getgenv().owner = string.sub(msg, 8)
                    stop()
                else
                    chatToOwner("Invalid user!")
                end

            elseif msg == prefix.."reload" then
                chatToOwner("Reloading...")
                stop()
                loadstring(game:HttpGet('https://raw.githubusercontent.com/Lythicals/script/main/minion.lua'))()

            elseif msg == prefix.."rejoin" then
                --queue_on_teleport([[loadstring(game:HttpGet('https://raw.githubusercontent.com/Lythicals/script/main/minion.lua'))()]])
                game:GetService("TeleportService"):TeleportToPlaceInstance(game.placeId, game.jobId, game.Players.LocalPlayer)

            elseif msg == prefix.."disconnect" then
                chatToOwner("Disconnected!")
                stop()

            else
                chatToOwner("Invalid command!")
            end
        end
    end
end)
