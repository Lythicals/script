-- my minion script :)

--// Commands
--[[

Universal:

- money [user] - Shows the amount of money a user has
- summon - Teleports minion to you
- followme - Minion follows you
- unfollowme - Minion stops following you

Da Hood:



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
        if msg == "asd" then -- create your conditions
            print("hi")
        elseif msg == prefix.."summon" then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[owner].Character.HumanoidRootPart.CFrame
        elseif msg == prefix.."followme" then
            followme = true
            repeat
                game.Players.LocalPlayer.Character.Humanoid.Sit = false
                game.Players.LocalPlayer.Character.Humanoid.WalkToPoint = game.Players[owner].Character.HumanoidRootPart.Position
            until followme = false or game:GetService("Players")[owner] == nil or not game.Players.LocalPlayer.Character:FindFirstChild("Character"):FindFirstChild("HumanoidRootPart")
        elseif msg == prefix.."unfollowme" then
            followme = false
        elseif msg == prefix.."reload" then
            OnOwnerChat:Disconnect()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
        elseif msg == prefix.."disconnect" then
            OnOwnerChat:Disconnect()
        else
            print("Command not found")
        end
    end
end)