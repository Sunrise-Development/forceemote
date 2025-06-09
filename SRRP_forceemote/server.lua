RegisterCommand("forceemote", function(source, args)
    if #args < 2 then
        TriggerClientEvent("chat:addMessage", source, {
            args = { "^1Nutzung:", "/forceemote [Spieler-ID] [Emote]" }
        })
        return
    end

    local targetId = tonumber(args[1])
    local emoteName = string.lower(args[2])

    if not targetId or not GetPlayerName(targetId) then
        TriggerClientEvent("chat:addMessage", source, {
            args = { "^1Fehler:", "Ungültige Spieler-ID." }
        })
        return
    end

    local scenario = Config.Emotes[emoteName]
    if not scenario then
        TriggerClientEvent("chat:addMessage", source, {
            args = { "^1Fehler:", "Emote '" .. emoteName .. "' nicht erlaubt. Verwende nur erlaubte Emotes." }
        })
        return
    end

    TriggerClientEvent("force_emote:play", targetId, scenario)

    TriggerClientEvent("chat:addMessage", -1, {
        args = { "^3System", "Spieler " .. GetPlayerName(targetId) .. " führt Emote '" .. emoteName .. "' aus." }
    })
end, true) -- true = nur Admins (optional)
