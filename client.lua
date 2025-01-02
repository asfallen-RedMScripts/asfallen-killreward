local VORPcore = {}
TriggerEvent("getCore", function(core)
    VORPcore = core
end)


local function HealWithEffect(ped)
 
    SetEntityInvincible(ped, true)
    

    local maxHealth = GetEntityMaxHealth(ped)
    SetEntityHealth(ped, maxHealth)
    
    Citizen.SetTimeout(1500, function()
        SetEntityInvincible(ped, false)
    end)
end

AddEventHandler("vorp_core:Client:OnPlayerDeath", function(killerserverid, causeofdeath)
    local playerServerId = GetPlayerServerId(PlayerId())
    
    if killerserverid and killerserverid > 0 and killerserverid ~= playerServerId then
        local killerPed = GetPlayerPed(GetPlayerFromServerId(killerserverid))
        if killerPed and killerPed ~= 0 then
            HealWithEffect(killerPed)
            TriggerServerEvent('PlayerKilled:HealKiller', killerserverid)
        end
    end
end)


RegisterNetEvent("triggerParticleAndHeal")
AddEventHandler("triggerParticleAndHeal", function()
    local playerPed = PlayerPedId()
    HealWithEffect(playerPed)
end)

