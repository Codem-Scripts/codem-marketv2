
Citizen.CreateThread(function()
    frameworkObject = GetFrameworkObject()
    createBlip()
end)


Citizen.CreateThread(function()
    while true do 
    local sleep = 1500
    local playerCoords = GetEntityCoords(PlayerPedId())     
    for k , v in pairs(Config.Market) do 
      
    local dist = #(playerCoords - v.marketCoords )
        if dist <= 3 then 
            sleep = 0
            DrawText3D(v.marketCoords.x,v.marketCoords.y,v.marketCoords.z + 0.98, Config.DrawText)
         
            if k then 
                if IsControlJustReleased(0,38) then
                    if Config.Framework ==  'esx' then 
                        frameworkObject.TriggerServerCallback('codem-report:playername', function(data)
                            local saat = GetClockHours()
                            if Config.MarketItems[k] ~= nil then 
                            SetNuiFocus(true, true)
                            SendNUIMessage({
                                type = "OPEN_MARKET",
                                items = Config.MarketItems[k],
                                bestsellers = Config.Bestsellers,
                                name = data,
                                logo = v.logo,
                                saat = saat
                            })  
                            else
                                Config.Notification(Config.Notifications["indexnil"].message, Config.Notifications["indexnil"].type)
                            end
                        
                        end)
                      

                    else
                        frameworkObject.Functions.TriggerCallback('codem-report:playername', function(data)
                            local saat = GetClockHours()
                            if Config.MarketItems[k] ~= nil then 
                            SetNuiFocus(true, true)
                            SendNUIMessage({
                                type = "OPEN_MARKET",
                                items = Config.MarketItems[k],
                                bestsellers = Config.Bestsellers,
                                name = data,
                                logo = v.logo,
                                saat = saat
                            })  
                            else
                                Config.Notification(Config.Notifications["indexnil"].message, Config.Notifications["indexnil"].type)
                            end
                        
                        end)

                    end
                  
                end
            end
        end
    end
        Citizen.Wait(sleep)
    end
end)



RegisterNUICallback('close', function()
    SetNuiFocus(false,false)
end)

RegisterNetEvent('codem-report:refresharea')
AddEventHandler('codem-report:refresharea', function()
    SendNUIMessage({
        type = "REFRESH",
    })

end)




RegisterNUICallback('buyitem', function(data)
  
        for k , v in pairs(data.buyitem) do             
         
            TriggerServerEvent('codem-market:additem',v.buyItemName,v.buyItemPrice,v.count,data.paytype)
        end
       
end)