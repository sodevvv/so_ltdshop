RegisterServerEvent(GetCurrentResourceName() .. ':buySold')
AddEventHandler(GetCurrentResourceName() .. ':buySold', function(items, price)
     local source = source
     local xPlayer = ESX.GetPlayerFromId(source)

     if xPlayer then
        if xPlayer.getMoney() >= price then
           xPlayer.removeMoney(price)
           for k,v in ipairs(items) do
               xPlayer.addInventoryItem(v.name, 1)
           end 
        else 
         ---TriggerClientEvent('esx:showNotification', source, 'Vous n\'avez pas assez d\'argent (' .. price .. '$)')
         TriggerClientEvent('ox_lib:notify', source, {
                title = "LTD 24/7",
                description = "Vous n\'avez pas assez d\'argent (" .. price .. '$)',
                icon = "fas fa-money-bill-alt",
                position = "bottom-center",
                duration = 5000
            })
        end
     end
end)