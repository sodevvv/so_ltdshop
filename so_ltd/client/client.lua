local shops = {}

CreateThread(function()
    for k,v in ipairs(Config.shops) do
        local data = {
            name = v.name,
            coords = v.coords,
            items = v.items,
            blips = v.blips
        }
        shops:build(data)  
    end
end)

function shops:openShop(items)
    SendNUIMessage({
        action = "open",
        shopData = items
    })
    SetNuiFocus(true, true)
end

RegisterNUICallback('buySold', function (data, cb)
    local items = data.sold
    local price = data.total
    TriggerServerEvent(GetCurrentResourceName() .. ":buySold", items, price)
    cb("kr")
    
end)

RegisterNuiCallback("closeShop", function (data, cb)
      SetNuiFocus(false, false) 
      cb("kr")
end)

function shops:build(data)
    if Config.interact == "so" then
        exports['so_interact']:CreateInteract(data.name, "fas fa-shopping-cart", "Ouvrir le magasin", "E", "#00A3FF", function()
             self:openShop(data.items)
        end)
        exports["so_interact"]:ShowInteract(data.name   , data.coords, 3.4, 0.0, 0.13, 0.4)
    else if Config.interact == "ox" then
            CreateThread(function()
                while true do 
                  local sleep = 1000 
                  local player = PlayerPedId()
                  local playerCoords = GetEntityCoords(player)
                  local dist = GetDistanceBetweenCoords(playerCoords, data.coords.xyz, false)

                  if dist <= 3.4 then
                    sleep = 0
                    lib.showTextUI("[E] - Ouvrir le magasin", {
                        position = "top-center",
                        icon = "fas fa-shopping-cart",
                        style = {
                            borderRadius = 7,
                            backgroundColor = '#00A3FF',
                            color = 'white'
                        }
                    })

                    if IsControlJustReleased(0, 51) then
                        self:openShop(data.items)
                    end
                else 
                    lib.hideTextUI()
                  end
                  Wait(sleep)
                end 
            end)
        end 
    end
    local blip = AddBlipForCoord(data.blips.blipCoords)
    SetBlipSprite(blip, data.blips.blipSprite)
    SetBlipColour(blip, data.blips.blipColour)
    SetBlipScale(blip, data.blips.blipScale)
    SetBlipDisplay(blip, data.blips.blipDisplay)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(data.blips.blipLabel)
    EndTextCommandSetBlipName(blip)
end
