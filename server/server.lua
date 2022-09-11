CreateThread(function()
    for k,v in pairs(Config.Items) do
        ESX.RegisterUsableItem(v.name, function(source)
            local event = "heist_consumables:".. v.name
            local xPlayer = ESX.GetPlayerFromId(source)
            xPlayer.removeInventoryItem(v.name, 1)
            TriggerClientEvent(event, source)
        end)
    end
end)