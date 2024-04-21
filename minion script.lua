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
local chatchannel = 'All' -- chat to 'All' channel by default

--// Functions

local function chat(msg,channel)
    game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(msg, channel)
end

--// Setup



--// Main

OnOwnerChat = game.Players[owner].Chatted:Connect(function(msg) -- runs once the player that joined chats a message
    if string.sub(msg, 1, 1) == prefix then
        if string.sub(msg, 2, 4) == "msg" then
            chat(string.sub(msg, 6), chatchannel)
        elseif msg == prefix.."summon" then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[owner].Character.HumanoidRootPart.CFrame
        elseif msg == prefix.."reload" then
            OnOwnerChat:Disconnect()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Lythicals/script/main/minion%20script.lua"))()
        elseif msg == prefix.."disconnect" then
            OnOwnerChat:Disconnect()
        else
            print("Command not found")
        end
    end
end)
