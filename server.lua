local VORPcore = {}
TriggerEvent("getCore", function(core)
    VORPcore = core
end)

RegisterNetEvent("vorp_core:Server:OnPlayerDeath")
AddEventHandler("vorp_core:Server:OnPlayerDeath", function(killerserverid, causeofdeath)
    local _source = source
    
    if killerserverid and killerserverid > 0 and killerserverid ~= _source then
        TriggerClientEvent("triggerParticleAndHeal", killerserverid)
    end
end)

RegisterServerEvent('PlayerKilled:HealKiller')
AddEventHandler('PlayerKilled:HealKiller', function(killer)
    local _source = killer
    
    if _source then
        local Player = VORPcore.getUser(_source)
        if Player then
            local Character = Player.getUsedCharacter
            if Character then
                TriggerClientEvent("vorp:Tip", _source, "Öldürme bonusu: Can yenilendi!", 3000)
            end
        end
    end
end)
