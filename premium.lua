local game_id = game.GameId

local games = {
    [4154513353] = "https://api.luarmor.net/files/v3/loaders/d60894b2b01e9d52119ee36d1bad9884.lua", -- Booga Booga [Reborn] Overworld
    [5750914919] = "https://api.luarmor.net/files/v3/loaders/1857e3fc2904e57cd888b7ea98b0bbdb.lua", -- Fisch
    [3808223175] = "https://api.luarmor.net/files/v3/loaders/01e70601843794a1346a62e3ea6b981e.lua" -- Jujutsu Infinite
}

loadstring(game:HttpGet(games[game_id]))()
