local game_id = game.GameId

local games = {
    [4154513353] = "https://api.luarmor.net/files/v3/loaders/1153bd5647b50bfc6b2f250495dba701.lua", -- Booga Booga [Reborn] Overworld
    [5750914919] = "https://api.luarmor.net/files/v3/loaders/d474a99b9800aaa6301496c9ce9834ce.lua" -- Fisch
}


loadstring(game:HttpGet(games[game_id]))()