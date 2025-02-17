local game_id = game.GameId

local games = {
    [4154513353] = "https://api.luarmor.net/files/v3/loaders/1153bd5647b50bfc6b2f250495dba701.lua", -- Booga Booga [Reborn] Overworld
    [5750914919] = "https://api.luarmor.net/files/v3/loaders/d474a99b9800aaa6301496c9ce9834ce.lua", -- Fisch
    [3808223175] = "https://api.luarmor.net/files/v3/loaders/01e70601843794a1346a62e3ea6b981e.lua", -- Jujutsu Infinite
    [4803373728] = "https://api.luarmor.net/files/v3/loaders/92e54b54fd719d9a5fd2d1858f5a3a83.lua" -- Lee RPG
}

loadstring(game:HttpGet(games[game_id]))()
