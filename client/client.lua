Drunklevel = 0
CreateThread(function()
    for k, v in pairs(Config.Items) do
        local event = "heist_consumables:" .. v.name
        local playerPed = PlayerPedId()
        RegisterNetEvent(event)
        AddEventHandler(event, function()
            
            local notify = "You've used " .. v.label
            if Config.MythicNotify then
                exports['mythic_notify']:SendAlert("success", notify)
            else
                ESX.ShowNotification(notify)
            end


            if v.anim then
                local animtable = v.anim
                SetAnim(animtable)
            else
                SetDefaultAnim()
            end

            -- HP
            if v.hp then
                local currenthp = GetEntityHealth(playerPed)
                local maxhp = GetPedMaxHealth(playerPed)
                local newhp = currenthp + v.hp
                if newhp > maxhp then
                    newhp = maxhp
                end
                SetEntityHealth(playerPed, newhp)
            end

            -- Armor
            if v.armour then
                local currentarmour = GetPedArmour(playerPed)
                local maxarmour = 100
                local newarmour = currentarmour + v.armour 
                if newarmour > maxarmour then
                    newarmour = maxarmour
                end
                SetPedArmour(playerPed, newarmour)
            end

            -- Hunger
            if v.hunger then
                TriggerEvent('esx_status:add', 'hunger', v.hunger)
            end

            -- Thirst
            if v.thirst then
                TriggerEvent('esx_status:add', 'thirst', v.thirst)
            end

            -- Stress
            if v.removestress then
                TriggerEvent('esx_status:remove', 'stress', 100000)
            end

            if v.addstress then
                TriggerEvent('esx_status:add', 'stress', 100000)
            end

            if v.perks['stamina'] then
                TriggerEvent('heist_consumables:SetPedStamina', v.perks['perk_duration'])
            end

            if v.perks['sprintmultiplier'] then
                TriggerEvent('heist_consumables:SetPedSprint', v.perks['perk_duration'])
            end

            if v.perks['swimmultiplier'] then
                TriggerEvent('heist_consumables:SetPedSwim', v.perks['perk_duration'])
            end

            if v.perks['meleemultiplier'] then
                TriggerEvent('heist_consumables:SetPedMelee', v.perks['perk_duration'])
            end

            if v.perks['adrenaline'] then
                TriggerEvent('heist_consumables:SetPedAdrenaline', v.perks['perk_duration'])
            end

            if v.drunk then
                TriggerEvent('heist_consumables:SetPedIsDrunk')
            end

        end)
    end
end)



RegisterNetEvent('heist_consumables:SetPedIsDrunk')
AddEventHandler('heist_consumables:SetPedIsDrunk', function()
    SetDrunk()
end)

RegisterNetEvent('heist_consumables:SetPedStamina')
AddEventHandler('heist_consumables:SetPedStamina', function(duration)
    SetStaminaPerk(duration)
end)

RegisterNetEvent('heist_consumables:SetPedAdrenaline')
AddEventHandler('heist_consumables:SetPedAdrenaline', function(duration)
    SetAdrenalinePerk(duration)
end)

RegisterNetEvent('heist_consumables:SetPedSprint')
AddEventHandler('heist_consumables:SetPedSprint', function(duration)
    SetSprintPerk(duration)
end)

RegisterNetEvent('heist_consumables:SetPedSwim')
AddEventHandler('heist_consumables:SetPedSwim', function(duration)
    SetSwimPerk(duration)
end)

RegisterNetEvent('heist_consumables:SetPedMelee')
AddEventHandler('heist_consumables:SetPedMelee', function(duration)
    SetMeleePerk(duration)
end)


function SetSprintPerk(duration)
    SetRunSprintMultiplierForPlayer(PlayerId(), 1.49)
    Wait(duration * 1000)
    SetRunSprintMultiplierForPlayer(PlayerId(), 1.0)
end

function SetStaminaPerk(duration)
    local times = duration / 10
    repeat
        ResetPlayerStamina(PlayerId())
        Wait(10000)
        times = times - 1
    until( times < 1.0 )
end

function SetSwimPerk(duration)
    SetSwimMultiplierForPlayer(PlayerId(), 1.49)
    Wait(duration * 1000)
    SetSwimMultiplierForPlayer(PlayerId(), 1.0)
end

function SetMeleePerk(duration)
    SetPlayerMeleeWeaponDamageModifier(PlayerId(), 2.0)
    Wait(duration * 1000)
    SetPlayerMeleeWeaponDamageModifier(PlayerId(), 1.0)
end


function SetAdrenalinePerk(duration)
    SetPlayerHealthRechargeLimit(PlayerId(), 1.0)
    SetPlayerHealthRechargeMultiplier(PlayerId(), 2.0)
    Wait(duration * 1000)
    SetPlayerHealthRechargeLimit(PlayerId(), 0.5)
    SetPlayerHealthRechargeMultiplier(PlayerId(), 1.0)
end

function SetDrunk()
    if Drunklevel == 0 then
        RequestAnimSet("move_m@drunk@slightlydrunk")
        while not HasAnimSetLoaded("move_m@drunk@slightlydrunk") do Citizen.Wait(0) end

        TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_DRUG_DEALER_HARD", 0, 1)
        DoScreenFadeOut(1000)
        Citizen.Wait(1000)
        ClearPedTasksImmediately(PlayerPedId())
        SetPedMotionBlur(PlayerPedId(), true)
        SetPedMovementClipset(PlayerPedId(), "move_m@drunk@slightlydrunk", true)
        RemoveAnimSet("move_m@drunk@slightlydrunk")
        SetPedIsDrunk(PlayerPedId(), true)
        SetTimecycleModifier("spectator5")
        DoScreenFadeIn(1000)
        ShakeGameplayCam('VIBRATE_SHAKE', 10.0)
        ShakeGameplayCam('DRUNK_SHAKE', 2.0)
    end

    if Drunklevel == 1 then
        RequestAnimSet("move_m@drunk@moderatedrunk")
        while not HasAnimSetLoaded("move_m@drunk@moderatedrunk") do Citizen.Wait(0) end

        TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_DRUG_DEALER_HARD", 0, 1)
        DoScreenFadeOut(1000)
        Citizen.Wait(1000)
        ClearPedTasksImmediately(PlayerPedId())
        SetPedMotionBlur(PlayerPedId(), true)
        SetPedMovementClipset(PlayerPedId(), "move_m@drunk@moderatedrunk", true)
        RemoveAnimSet("move_m@drunk@moderatedrunk")
        SetPedIsDrunk(PlayerPedId(), true)
        SetTimecycleModifier("spectator5")
        DoScreenFadeIn(1000)
        ShakeGameplayCam('VIBRATE_SHAKE', 20.0)
        ShakeGameplayCam('DRUNK_SHAKE', 3.0)
    end

    if Drunklevel == 2 then
        RequestAnimSet("move_m@drunk@verydrunk")
        while not HasAnimSetLoaded("move_m@drunk@verydrunk") do Citizen.Wait(0) end

        TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_DRUG_DEALER_HARD", 0, 1)
        DoScreenFadeOut(1000)
        Citizen.Wait(1000)
        ClearPedTasksImmediately(PlayerPedId())
        SetPedMotionBlur(PlayerPedId(), true)
        SetPedMovementClipset(PlayerPedId(), "move_m@drunk@verydrunk", true)
        RemoveAnimSet("move_m@drunk@verydrunk")
        SetPedIsDrunk(PlayerPedId(), true)
        SetTimecycleModifier("spectator5")
        DoScreenFadeIn(1000)
        ShakeGameplayCam('VIBRATE_SHAKE', 20.0)
        ShakeGameplayCam('DRUNK_SHAKE', 4.0)
    end
    Drunklevel = Drunklevel + 1
    Wait(60000)
    ClearEffects()
end


function ClearEffects()
    DoScreenFadeOut(800)
    Wait(1000)

    ClearTimecycleModifier()
    ResetScenarioTypesEnabled()
    ShakeGameplayCam('DRUNK_SHAKE', 0.0)
    ResetPedMovementClipset(PlayerPedId(), 0)
    SetPedIsDrunk(PlayerPedId(), false)
    SetPedMotionBlur(PlayerPedId(), false)
    DoScreenFadeIn(800)
    ClearPedSecondaryTask(PlayerPedId())
    drunklevel = 0
end

function SetAnim(animtable)
    local playerPed  = PlayerPedId()
    local animatdict = animtable.animatdict
    local animation = animtable.animation
    local prop_name = animtable.prop_name
    local x,y,z = table.unpack(GetEntityCoords(playerPed))
    local prop = CreateObject(joaat(prop_name), x, y, z + 0.2, true, true, true)
    local boneIndex = GetPedBoneIndex(playerPed, animtable.bones)
    local rotate = animtable.prop_rotate



    AttachEntityToEntity(prop, playerPed, boneIndex, 0.12, 0.028, 0.001, rotate.x, rotate.y, rotate.z, true, true, false, true, 1, true)

    ESX.Streaming.RequestAnimDict(animatdict, function()
        TaskPlayAnim(playerPed, animatdict, animation, 8.0, -8, -1, 49, 0, 0, 0, 0)
        RemoveAnimDict(animatdict)

        Wait(3000)
        IsAnimated = false
        ClearPedSecondaryTask(playerPed)
        DeleteObject(prop)
    end)

end

function SetDefaultAnim()
    local playerPed  = PlayerPedId()
    animatdict = 'mp_player_inteat@burger'
    animation = 'mp_player_int_eat_burger_fp'
    prop_name = 'prop_cs_burger_01'
    local x,y,z = table.unpack(GetEntityCoords(playerPed))
    local prop = CreateObject(joaat(prop_name), x, y, z + 0.2, true, true, true)
    local boneIndex = GetPedBoneIndex(playerPed, 18905)
    local rotate = vector3(10.0, 175.0, 0.0)



    AttachEntityToEntity(prop, playerPed, boneIndex, 0.12, 0.028, 0.001, rotate.x, rotate.y, rotate.z, true, true, false, true, 1, true)

    ESX.Streaming.RequestAnimDict(animatdict, function()
        TaskPlayAnim(playerPed, animatdict, animation, 8.0, -8, -1, 49, 0, 0, 0, 0)
        RemoveAnimDict(animatdict)

        Wait(3000)
        IsAnimated = false
        ClearPedSecondaryTask(playerPed)
        DeleteObject(prop)
    end)

end
