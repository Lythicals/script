repeat wait() until game:IsLoaded()

-- my minion script :)

--// Commands
--[[

Universal:

- summon - Teleports minion to you
- follow - Minion follows you
- unfollow - Minion stops following you

Da Hood:

- money [user] - Shows the amount of money a user has

--]]
--// Credits
--[[

- Thank you to @fosterobject for all the ideas & kindness (1058766950899134565) :)

--]]
--// Variables

local owner = 'Swagicals'
local prefix = '?'
local WhisperToOwner = game:GetService('RobloxReplicatedStorage').ExperienceChat.WhisperChat:InvokeServer(game.Players[owner].UserId)
WhisperToOwner:SendAsync("Connected!")

--// Functions

local function chatToOwner(msg)
    WhisperToOwner:SendAsync(msg)
end

local function chat(msg)
    game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync(msg)
end

--// Setup



--// Main

OnOwnerChat = game.Players[owner].Chatted:Connect(function(msg) -- runs once the player that joined chats a message
    if string.sub(msg, 1, 1) == prefix then
        if string.sub(msg, 2, 4) == "msg" then
            chat(string.sub(msg, 6))
        elseif msg == prefix.."summon" then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[owner].Character.HumanoidRootPart.CFrame
        elseif msg == prefix.."reset" then
            game.Players.LocalPlayer.Character.Head:Destroy()
        elseif msg == prefix.."rejoin" then
            queue_on_teleport("loadstring(game:HttpGet('https://raw.githubusercontent.com/Lythicals/script/main/minion%20script.lua'))()")
            game:GetService("TeleportService"):TeleportToPlaceInstance(game.placeId, game.jobId, game.Players.LocalPlayer)
        else
            chatToOwner("Invalid command!")
        end
    end
end)
