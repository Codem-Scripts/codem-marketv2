Config = {}
Config.Framework = 'newqb' -- esx , qb , newqb
Config.DrawText = '[E] Market'

function DrawText3D(x, y, z, text)
    local onScreen,_x,_y=World3dToScreen2d(x, y, z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    SetTextScale(0.3, 0.3)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 90)
 end
 
 
 
 
 Config.Notifications = { -- Notifications
 ["notcashh"] = {
   message = 'Yeterli nakit paranız yok',
   type = "success",
},
["notbankcash"] = {
   message = 'Bankada yeterli nakit paranız yok',
   type = "success",
},
["succesitem"] = {
   message = 'Başarıyla öğe alındı.',
   type = "success",
},
["indexnil"] = {
    message = 'Hata',
    type = "success",

     },
 
 
 
 
 
 
 }
 
 function GetName(source)
   if Config.Framework == "esx" then
      local xPlayer = frameworkObject.GetPlayerFromId(tonumber(source))
      if xPlayer then
         return xPlayer.getName()
      else
         return "0"
      end
   else
      local Player = frameworkObject.Functions.GetPlayer(tonumber(source))
      if Player then
         return Player.PlayerData.charinfo.firstname .. ' ' ..Player.PlayerData.charinfo.lastname
      else
         return "0"
      end
   end
   end

   
 Config.Notification = function(message, type, isServer, src) -- You can change here events for notifications
 if isServer then
    if Config.Framework == "esx" then
       TriggerClientEvent("esx:showNotification", src, message)
    else
       TriggerClientEvent('QBCore:Notify', src, message, type, 1500)
    end
 else
    if Config.Framework == "esx" then
       TriggerEvent("esx:showNotification", message)
    else
       TriggerEvent('QBCore:Notify', message, type, 1500)
    end
 end
 end

--  function createBlip()

--   		for k,v in pairs(Config.Market) do
		
-- 				local blip = AddBlipForCoord(vector3(v.marketCoords.x, v.marketCoords.y, v.marketCoords.z))
-- 					SetBlipSprite (blip, 52)
-- 					SetBlipDisplay(blip, 4)
-- 					SetBlipScale  (blip,0.8)
-- 					SetBlipColour (blip, 29)
-- 					SetBlipAsShortRange(blip, true)
-- 					BeginTextCommandSetBlipName("STRING")
-- 					AddTextComponentString('Market')
--                EndTextCommandSetBlipName(blip)
					
	
--  		end

-- end


Config.Market = {

   [1] = {marketCoords = vector3(373.875, 325.896,  102.566),logo = '724'},
   [2] = {marketCoords = vector3(2557.458,382.282,107.622), logo = '724'},
   [3] = {marketCoords = vector3( -3038.939, 585.954,6.908) , logo = '724'},
   [4] = {marketCoords = vector3( -1487.553, -379.107, 39.163), logo = 'liquor'},
   [5] = {marketCoords = vector3(1392.562, 3604.684, 33.980) ,logo = 'liquor'},
   [6] = {marketCoords = vector3(-2968.243,390.910,  14.043),logo = 'liquor'},
   [7] = {marketCoords = vector3(2678.916, 3280.671, 54.24),logo = '724'},
   [8] = {marketCoords = vector3( -48.519,  -1757.514, 28.421),logo = 'ltd'},
   [9] = {marketCoords = vector3(1163.373, -323.801,  68.205),logo = 'ltd'},
   [10] = {marketCoords = vector3( -707.501, -914.260, 18.215) ,logo = 'ltd'},
   [11] = {marketCoords = vector3(-1820.523,792.518,  137.118), logo = 'ltd'},
   [12] = {marketCoords = vector3(1698.388, 4924.404, 41.063),logo = 'ltd'},
   [13] = {marketCoords = vector3(1961.464, 3740.672, 31.343),logo = '724'},
   [14] = {marketCoords = vector3(1135.808, -982.281,  45.415),logo = 'liquor'},
   [15] = {marketCoords = vector3( 25.88,   -1347.1,  28.5),logo = '724'},
   [16] = {marketCoords = vector3(547.431,   2671.710, 41.156),logo = '724'},
   [17] = {marketCoords = vector3( -3241.927, 1001.462,  11.830),logo = '724'},
   [18] = {marketCoords = vector3(1166.024, 2708.930,   37.157),logo = 'liquor'},
   [19] = {marketCoords = vector3(1729.216, 6414.131,  34.037),logo = '724'},
}

--Categories ::   fruits , drinks ,fastfood , medicals , tools ,alcohols


Config.Bestsellers = {   --max 5
   {
      name = 'Phone',
      itemName = 'phone',
      itemImage = 'phone',
      itemPrice = 1000,
      itemCategories = 'drinks'

   },
   {
      name = 'Water',
      itemName = 'water_bottle',
      itemImage = 'water',
      itemPrice = 1000,
      itemCategories = 'drinks'

   },
   {
      name = 'Hamburger',
      itemName = 'tosti',
      itemImage = 'hamburger',
      itemPrice = 1000,
      itemCategories = 'fastfood'

   },
   {
      name = 'Cola',
      itemName = 'kurkakola',
      itemImage = 'cola',
      itemPrice = 1000,
      itemCategories = 'drinks'
   },

   {
      name = 'Twerks',
      itemName = 'twerks_candy',
      itemImage = 'donut',
      itemPrice = 1000,
      itemCategories = 'drinks'
   },

}


-- Categories  = drinks fastfood alcohols medicals tools fruits

Config.MarketItems = {
   [1] = { -- Config.Market  number market ---

      {
         name = 'Water',
         itemName = 'water_bottle',
         itemImage = 'water',
         itemPrice = 1000,
         itemCategories = 'drinks'
      },

      {
         name = 'Cola',
         itemName = 'kurkakola',
         itemImage = 'cola',
         itemPrice = 1000,
         itemCategories = 'drinks'
      },

      {
         name = 'Bread',
         itemName = 'sandwich',
         itemImage = 'bread',
         itemPrice = 1000,
         itemCategories = 'fastfood'
      },
      {
         name = 'Hamburger',
         itemName = 'sandwich',
         itemImage = 'hamburger',
         itemPrice = 1000,
         itemCategories = 'fastfood'
      },


      {
         name = 'Medkit',
         itemName = 'firstaid',
         itemImage = 'MedArmor',
         itemPrice = 1000,
         itemCategories = 'medicals'
      },
      {
         name = 'Bandage',
         itemName = 'bandage',
         itemImage = 'bandage',
         itemPrice = 1000,
         itemCategories = 'medicals'
      },

      {
         name = 'Repairkit',
         itemName = 'repairkit',
         itemImage = 'fixkit',
         itemPrice = 1000,
         itemCategories = 'tools'
      }

      -- {
      --    name = 'Orange',
      --    itemName = 'portakal',
      --    itemImage = 'portakal',
      --    itemPrice = 1000,
      --    itemCategories = 'fruits'
      -- }

   },

   [2] = { -- Config.Market  number market ---

   {
      name = 'Water',
      itemName = 'water_bottle',
      itemImage = 'water',
      itemPrice = 1000,
      itemCategories = 'drinks'
   },

   {
      name = 'Cola',
      itemName = 'kurkakola',
      itemImage = 'cola',
      itemPrice = 1000,
      itemCategories = 'drinks'
   },

   {
      name = 'Bread',
      itemName = 'sandwich',
      itemImage = 'bread',
      itemPrice = 1000,
      itemCategories = 'fastfood'
   },
   {
      name = 'Hamburger',
      itemName = 'sandwich',
      itemImage = 'hamburger',
      itemPrice = 1000,
      itemCategories = 'fastfood'
   },


   {
      name = 'Medkit',
      itemName = 'firstaid',
      itemImage = 'MedArmor',
      itemPrice = 1000,
      itemCategories = 'medicals'
   },
   {
      name = 'Bandage',
      itemName = 'bandage',
      itemImage = 'bandage',
      itemPrice = 1000,
      itemCategories = 'medicals'
   },

   {
      name = 'Repairkit',
      itemName = 'repairkit',
      itemImage = 'fixkit',
      itemPrice = 1000,
      itemCategories = 'tools'
   }

   -- {
   --    name = 'Orange',
   --    itemName = 'portakal',
   --    itemImage = 'portakal',
   --    itemPrice = 1000,
   --    itemCategories = 'fruits'
   -- }

   },
   [3] = { -- Config.Market  number market ---

   {
      name = 'Water',
      itemName = 'water_bottle',
      itemImage = 'water',
      itemPrice = 1000,
      itemCategories = 'drinks'
   },

   {
      name = 'Cola',
      itemName = 'kurkakola',
      itemImage = 'cola',
      itemPrice = 1000,
      itemCategories = 'drinks'
   },

   {
      name = 'Bread',
      itemName = 'sandwich',
      itemImage = 'bread',
      itemPrice = 1000,
      itemCategories = 'fastfood'
   },
   {
      name = 'Hamburger',
      itemName = 'sandwich',
      itemImage = 'hamburger',
      itemPrice = 1000,
      itemCategories = 'fastfood'
   },


   {
      name = 'Medkit',
      itemName = 'firstaid',
      itemImage = 'MedArmor',
      itemPrice = 1000,
      itemCategories = 'medicals'
   },
   {
      name = 'Bandage',
      itemName = 'bandage',
      itemImage = 'bandage',
      itemPrice = 1000,
      itemCategories = 'medicals'
   },

   {
      name = 'Repairkit',
      itemName = 'repairkit',
      itemImage = 'fixkit',
      itemPrice = 1000,
      itemCategories = 'tools'
   }

   -- {
   --    name = 'Orange',
   --    itemName = 'portakal',
   --    itemImage = 'portakal',
   --    itemPrice = 1000,
   --    itemCategories = 'fruits'
   -- }

   },
   [4] = { -- Config.Market  number market ---

      {
         name = 'Water',
         itemName = 'water_bottle',
         itemImage = 'water',
         itemPrice = 1000,
         itemCategories = 'drinks'
      },

      {
         name = 'Cola',
         itemName = 'kurkakola',
         itemImage = 'cola',
         itemPrice = 1000,
         itemCategories = 'drinks'
      },

      {
         name = 'Bread',
         itemName = 'sandwich',
         itemImage = 'bread',
         itemPrice = 1000,
         itemCategories = 'fastfood'
      },
      {
         name = 'Hamburger',
         itemName = 'sandwich',
         itemImage = 'hamburger',
         itemPrice = 1000,
         itemCategories = 'fastfood'
      },


      {
         name = 'Medkit',
         itemName = 'firstaid',
         itemImage = 'MedArmor',
         itemPrice = 1000,
         itemCategories = 'medicals'
      },
      {
         name = 'Bandage',
         itemName = 'bandage',
         itemImage = 'bandage',
         itemPrice = 1000,
         itemCategories = 'medicals'
      },

      {
         name = 'Repairkit',
         itemName = 'repairkit',
         itemImage = 'fixkit',
         itemPrice = 1000,
         itemCategories = 'tools'
      }

      -- {
      --    name = 'Orange',
      --    itemName = 'portakal',
      --    itemImage = 'portakal',
      --    itemPrice = 1000,
      --    itemCategories = 'fruits'
      -- }

   },
   [5] = { -- Config.Market  number market ---

   {
      name = 'Water',
      itemName = 'water_bottle',
      itemImage = 'water',
      itemPrice = 1000,
      itemCategories = 'drinks'
   },

   {
      name = 'Cola',
      itemName = 'kurkakola',
      itemImage = 'cola',
      itemPrice = 1000,
      itemCategories = 'drinks'
   },

   {
      name = 'Bread',
      itemName = 'sandwich',
      itemImage = 'bread',
      itemPrice = 1000,
      itemCategories = 'fastfood'
   },
   {
      name = 'Hamburger',
      itemName = 'sandwich',
      itemImage = 'hamburger',
      itemPrice = 1000,
      itemCategories = 'fastfood'
   },


   {
      name = 'Medkit',
      itemName = 'firstaid',
      itemImage = 'MedArmor',
      itemPrice = 1000,
      itemCategories = 'medicals'
   },
   {
      name = 'Bandage',
      itemName = 'bandage',
      itemImage = 'bandage',
      itemPrice = 1000,
      itemCategories = 'medicals'
   },

   {
      name = 'Repairkit',
      itemName = 'repairkit',
      itemImage = 'fixkit',
      itemPrice = 1000,
      itemCategories = 'tools'
   }

   -- {
   --    name = 'Orange',
   --    itemName = 'portakal',
   --    itemImage = 'portakal',
   --    itemPrice = 1000,
   --    itemCategories = 'fruits'
   -- }

   },
   [6] = { -- Config.Market  number market ---

   {
      name = 'Water',
      itemName = 'water_bottle',
      itemImage = 'water',
      itemPrice = 1000,
      itemCategories = 'drinks'
   },

   {
      name = 'Cola',
      itemName = 'kurkakola',
      itemImage = 'cola',
      itemPrice = 1000,
      itemCategories = 'drinks'
   },

   {
      name = 'Bread',
      itemName = 'sandwich',
      itemImage = 'bread',
      itemPrice = 1000,
      itemCategories = 'fastfood'
   },
   {
      name = 'Hamburger',
      itemName = 'sandwich',
      itemImage = 'hamburger',
      itemPrice = 1000,
      itemCategories = 'fastfood'
   },


   {
      name = 'Medkit',
      itemName = 'firstaid',
      itemImage = 'MedArmor',
      itemPrice = 1000,
      itemCategories = 'medicals'
   },
   {
      name = 'Bandage',
      itemName = 'bandage',
      itemImage = 'bandage',
      itemPrice = 1000,
      itemCategories = 'medicals'
   },

   {
      name = 'Repairkit',
      itemName = 'repairkit',
      itemImage = 'fixkit',
      itemPrice = 1000,
      itemCategories = 'tools'
   }

   -- {
   --    name = 'Orange',
   --    itemName = 'portakal',
   --    itemImage = 'portakal',
   --    itemPrice = 1000,
   --    itemCategories = 'fruits'
   -- }

   },
   [7] = { -- Config.Market  number market ---

   {
      name = 'Water',
      itemName = 'water_bottle',
      itemImage = 'water',
      itemPrice = 1000,
      itemCategories = 'drinks'
   },

   {
      name = 'Cola',
      itemName = 'kurkakola',
      itemImage = 'cola',
      itemPrice = 1000,
      itemCategories = 'drinks'
   },

   {
      name = 'Bread',
      itemName = 'sandwich',
      itemImage = 'bread',
      itemPrice = 1000,
      itemCategories = 'fastfood'
   },
   {
      name = 'Hamburger',
      itemName = 'sandwich',
      itemImage = 'hamburger',
      itemPrice = 1000,
      itemCategories = 'fastfood'
   },


   {
      name = 'Medkit',
      itemName = 'firstaid',
      itemImage = 'MedArmor',
      itemPrice = 1000,
      itemCategories = 'medicals'
   },
   {
      name = 'Bandage',
      itemName = 'bandage',
      itemImage = 'bandage',
      itemPrice = 1000,
      itemCategories = 'medicals'
   },

   {
      name = 'Repairkit',
      itemName = 'repairkit',
      itemImage = 'fixkit',
      itemPrice = 1000,
      itemCategories = 'tools'
   }

   -- {
   --    name = 'Orange',
   --    itemName = 'portakal',
   --    itemImage = 'portakal',
   --    itemPrice = 1000,
   --    itemCategories = 'fruits'
   -- }

   },
   [8] = { -- Config.Market  number market ---

   {
      name = 'Water',
      itemName = 'water_bottle',
      itemImage = 'water',
      itemPrice = 1000,
      itemCategories = 'drinks'
   },

   {
      name = 'Cola',
      itemName = 'kurkakola',
      itemImage = 'cola',
      itemPrice = 1000,
      itemCategories = 'drinks'
   },

   {
      name = 'Bread',
      itemName = 'sandwich',
      itemImage = 'bread',
      itemPrice = 1000,
      itemCategories = 'fastfood'
   },
   {
      name = 'Hamburger',
      itemName = 'sandwich',
      itemImage = 'hamburger',
      itemPrice = 1000,
      itemCategories = 'fastfood'
   },


   {
      name = 'Medkit',
      itemName = 'firstaid',
      itemImage = 'MedArmor',
      itemPrice = 1000,
      itemCategories = 'medicals'
   },
   {
      name = 'Bandage',
      itemName = 'bandage',
      itemImage = 'bandage',
      itemPrice = 1000,
      itemCategories = 'medicals'
   },

   {
      name = 'Repairkit',
      itemName = 'repairkit',
      itemImage = 'fixkit',
      itemPrice = 1000,
      itemCategories = 'tools'
   }

   -- {
   --    name = 'Orange',
   --    itemName = 'portakal',
   --    itemImage = 'portakal',
   --    itemPrice = 1000,
   --    itemCategories = 'fruits'
   -- }

   },
   [9] = { -- Config.Market  number market ---

   {
      name = 'Water',
      itemName = 'water_bottle',
      itemImage = 'water',
      itemPrice = 1000,
      itemCategories = 'drinks'
   },

   {
      name = 'Cola',
      itemName = 'kurkakola',
      itemImage = 'cola',
      itemPrice = 1000,
      itemCategories = 'drinks'
   },

   {
      name = 'Bread',
      itemName = 'sandwich',
      itemImage = 'bread',
      itemPrice = 1000,
      itemCategories = 'fastfood'
   },
   {
      name = 'Hamburger',
      itemName = 'sandwich',
      itemImage = 'hamburger',
      itemPrice = 1000,
      itemCategories = 'fastfood'
   },


   {
      name = 'Medkit',
      itemName = 'firstaid',
      itemImage = 'MedArmor',
      itemPrice = 1000,
      itemCategories = 'medicals'
   },
   {
      name = 'Bandage',
      itemName = 'bandage',
      itemImage = 'bandage',
      itemPrice = 1000,
      itemCategories = 'medicals'
   },

   {
      name = 'Repairkit',
      itemName = 'repairkit',
      itemImage = 'fixkit',
      itemPrice = 1000,
      itemCategories = 'tools'
   }

   -- {
   --    name = 'Orange',
   --    itemName = 'portakal',
   --    itemImage = 'portakal',
   --    itemPrice = 1000,
   --    itemCategories = 'fruits'
   -- }

   },
   [10] = { -- Config.Market  number market ---

   {
      name = 'Water',
      itemName = 'water_bottle',
      itemImage = 'water',
      itemPrice = 1000,
      itemCategories = 'drinks'
   },

   {
      name = 'Cola',
      itemName = 'kurkakola',
      itemImage = 'cola',
      itemPrice = 1000,
      itemCategories = 'drinks'
   },

   {
      name = 'Bread',
      itemName = 'sandwich',
      itemImage = 'bread',
      itemPrice = 1000,
      itemCategories = 'fastfood'
   },
   {
      name = 'Hamburger',
      itemName = 'sandwich',
      itemImage = 'hamburger',
      itemPrice = 1000,
      itemCategories = 'fastfood'
   },


   {
      name = 'Medkit',
      itemName = 'firstaid',
      itemImage = 'MedArmor',
      itemPrice = 1000,
      itemCategories = 'medicals'
   },
   {
      name = 'Bandage',
      itemName = 'bandage',
      itemImage = 'bandage',
      itemPrice = 1000,
      itemCategories = 'medicals'
   },

   {
      name = 'Repairkit',
      itemName = 'repairkit',
      itemImage = 'fixkit',
      itemPrice = 1000,
      itemCategories = 'tools'
   }

   -- {
   --    name = 'Orange',
   --    itemName = 'portakal',
   --    itemImage = 'portakal',
   --    itemPrice = 1000,
   --    itemCategories = 'fruits'
   -- }

   },
   [11] = { -- Config.Market  number market ---

   {
      name = 'Water',
      itemName = 'water_bottle',
      itemImage = 'water',
      itemPrice = 1000,
      itemCategories = 'drinks'
   },

   {
      name = 'Cola',
      itemName = 'kurkakola',
      itemImage = 'cola',
      itemPrice = 1000,
      itemCategories = 'drinks'
   },

   {
      name = 'Bread',
      itemName = 'sandwich',
      itemImage = 'bread',
      itemPrice = 1000,
      itemCategories = 'fastfood'
   },
   {
      name = 'Hamburger',
      itemName = 'sandwich',
      itemImage = 'hamburger',
      itemPrice = 1000,
      itemCategories = 'fastfood'
   },


   {
      name = 'Medkit',
      itemName = 'firstaid',
      itemImage = 'MedArmor',
      itemPrice = 1000,
      itemCategories = 'medicals'
   },
   {
      name = 'Bandage',
      itemName = 'bandage',
      itemImage = 'bandage',
      itemPrice = 1000,
      itemCategories = 'medicals'
   },

   {
      name = 'Repairkit',
      itemName = 'repairkit',
      itemImage = 'fixkit',
      itemPrice = 1000,
      itemCategories = 'tools'
   }

   -- {
   --    name = 'Orange',
   --    itemName = 'portakal',
   --    itemImage = 'portakal',
   --    itemPrice = 1000,
   --    itemCategories = 'fruits'
   -- }

   },
   [12] = { -- Config.Market  number market ---

   {
      name = 'Water',
      itemName = 'water_bottle',
      itemImage = 'water',
      itemPrice = 1000,
      itemCategories = 'drinks'
   },

   {
      name = 'Cola',
      itemName = 'kurkakola',
      itemImage = 'cola',
      itemPrice = 1000,
      itemCategories = 'drinks'
   },

   {
      name = 'Bread',
      itemName = 'sandwich',
      itemImage = 'bread',
      itemPrice = 1000,
      itemCategories = 'fastfood'
   },
   {
      name = 'Hamburger',
      itemName = 'sandwich',
      itemImage = 'hamburger',
      itemPrice = 1000,
      itemCategories = 'fastfood'
   },


   {
      name = 'Medkit',
      itemName = 'firstaid',
      itemImage = 'MedArmor',
      itemPrice = 1000,
      itemCategories = 'medicals'
   },
   {
      name = 'Bandage',
      itemName = 'bandage',
      itemImage = 'bandage',
      itemPrice = 1000,
      itemCategories = 'medicals'
   },

   {
      name = 'Repairkit',
      itemName = 'repairkit',
      itemImage = 'fixkit',
      itemPrice = 1000,
      itemCategories = 'tools'
   }

   -- {
   --    name = 'Orange',
   --    itemName = 'portakal',
   --    itemImage = 'portakal',
   --    itemPrice = 1000,
   --    itemCategories = 'fruits'
   -- }

   },
   [13] = { -- Config.Market  number market ---

   {
      name = 'Water',
      itemName = 'water_bottle',
      itemImage = 'water',
      itemPrice = 1000,
      itemCategories = 'drinks'
   },

   {
      name = 'Cola',
      itemName = 'kurkakola',
      itemImage = 'cola',
      itemPrice = 1000,
      itemCategories = 'drinks'
   },

   {
      name = 'Bread',
      itemName = 'sandwich',
      itemImage = 'bread',
      itemPrice = 1000,
      itemCategories = 'fastfood'
   },
   {
      name = 'Hamburger',
      itemName = 'sandwich',
      itemImage = 'hamburger',
      itemPrice = 1000,
      itemCategories = 'fastfood'
   },


   {
      name = 'Medkit',
      itemName = 'firstaid',
      itemImage = 'MedArmor',
      itemPrice = 1000,
      itemCategories = 'medicals'
   },
   {
      name = 'Bandage',
      itemName = 'bandage',
      itemImage = 'bandage',
      itemPrice = 1000,
      itemCategories = 'medicals'
   },

   {
      name = 'Repairkit',
      itemName = 'repairkit',
      itemImage = 'fixkit',
      itemPrice = 1000,
      itemCategories = 'tools'
   }

   -- {
   --    name = 'Orange',
   --    itemName = 'portakal',
   --    itemImage = 'portakal',
   --    itemPrice = 1000,
   --    itemCategories = 'fruits'
   -- }

   },
   [14] = { -- Config.Market  number market ---

   {
      name = 'Water',
      itemName = 'water_bottle',
      itemImage = 'water',
      itemPrice = 1000,
      itemCategories = 'drinks'
   },

   {
      name = 'Cola',
      itemName = 'kurkakola',
      itemImage = 'cola',
      itemPrice = 1000,
      itemCategories = 'drinks'
   },

   {
      name = 'Bread',
      itemName = 'sandwich',
      itemImage = 'bread',
      itemPrice = 1000,
      itemCategories = 'fastfood'
   },
   {
      name = 'Hamburger',
      itemName = 'sandwich',
      itemImage = 'hamburger',
      itemPrice = 1000,
      itemCategories = 'fastfood'
   },


   {
      name = 'Medkit',
      itemName = 'firstaid',
      itemImage = 'MedArmor',
      itemPrice = 1000,
      itemCategories = 'medicals'
   },
   {
      name = 'Bandage',
      itemName = 'bandage',
      itemImage = 'bandage',
      itemPrice = 1000,
      itemCategories = 'medicals'
   },

   {
      name = 'Repairkit',
      itemName = 'repairkit',
      itemImage = 'fixkit',
      itemPrice = 1000,
      itemCategories = 'tools'
   }

   -- {
   --    name = 'Orange',
   --    itemName = 'portakal',
   --    itemImage = 'portakal',
   --    itemPrice = 1000,
   --    itemCategories = 'fruits'
   -- }

   },
   [15] = { -- Config.Market  number market ---

   {
      name = 'Water',
      itemName = 'water_bottle',
      itemImage = 'water',
      itemPrice = 1000,
      itemCategories = 'drinks'
   },

   {
      name = 'Cola',
      itemName = 'kurkakola',
      itemImage = 'cola',
      itemPrice = 1000,
      itemCategories = 'drinks'
   },

   {
      name = 'Bread',
      itemName = 'sandwich',
      itemImage = 'bread',
      itemPrice = 1000,
      itemCategories = 'fastfood'
   },
   {
      name = 'Hamburger',
      itemName = 'sandwich',
      itemImage = 'hamburger',
      itemPrice = 1000,
      itemCategories = 'fastfood'
   },


   {
      name = 'Medkit',
      itemName = 'firstaid',
      itemImage = 'MedArmor',
      itemPrice = 1000,
      itemCategories = 'medicals'
   },
   {
      name = 'Bandage',
      itemName = 'bandage',
      itemImage = 'bandage',
      itemPrice = 1000,
      itemCategories = 'medicals'
   },

   {
      name = 'Repairkit',
      itemName = 'repairkit',
      itemImage = 'fixkit',
      itemPrice = 1000,
      itemCategories = 'tools'
   }

   -- {
   --    name = 'Orange',
   --    itemName = 'portakal',
   --    itemImage = 'portakal',
   --    itemPrice = 1000,
   --    itemCategories = 'fruits'
   -- }

   },
   [16] = { -- Config.Market  number market ---

   {
      name = 'Water',
      itemName = 'water_bottle',
      itemImage = 'water',
      itemPrice = 1000,
      itemCategories = 'drinks'
   },

   {
      name = 'Cola',
      itemName = 'kurkakola',
      itemImage = 'cola',
      itemPrice = 1000,
      itemCategories = 'drinks'
   },

   {
      name = 'Bread',
      itemName = 'sandwich',
      itemImage = 'bread',
      itemPrice = 1000,
      itemCategories = 'fastfood'
   },
   {
      name = 'Hamburger',
      itemName = 'sandwich',
      itemImage = 'hamburger',
      itemPrice = 1000,
      itemCategories = 'fastfood'
   },


   {
      name = 'Medkit',
      itemName = 'firstaid',
      itemImage = 'MedArmor',
      itemPrice = 1000,
      itemCategories = 'medicals'
   },
   {
      name = 'Bandage',
      itemName = 'bandage',
      itemImage = 'bandage',
      itemPrice = 1000,
      itemCategories = 'medicals'
   },

   {
      name = 'Repairkit',
      itemName = 'repairkit',
      itemImage = 'fixkit',
      itemPrice = 1000,
      itemCategories = 'tools'
   }

   -- {
   --    name = 'Orange',
   --    itemName = 'portakal',
   --    itemImage = 'portakal',
   --    itemPrice = 1000,
   --    itemCategories = 'fruits'
   -- }

   },
   [17] = { -- Config.Market  number market ---

   {
      name = 'Water',
      itemName = 'water_bottle',
      itemImage = 'water',
      itemPrice = 1000,
      itemCategories = 'drinks'
   },

   {
      name = 'Cola',
      itemName = 'kurkakola',
      itemImage = 'cola',
      itemPrice = 1000,
      itemCategories = 'drinks'
   },

   {
      name = 'Bread',
      itemName = 'sandwich',
      itemImage = 'bread',
      itemPrice = 1000,
      itemCategories = 'fastfood'
   },
   {
      name = 'Hamburger',
      itemName = 'sandwich',
      itemImage = 'hamburger',
      itemPrice = 1000,
      itemCategories = 'fastfood'
   },


   {
      name = 'Medkit',
      itemName = 'firstaid',
      itemImage = 'MedArmor',
      itemPrice = 1000,
      itemCategories = 'medicals'
   },
   {
      name = 'Bandage',
      itemName = 'bandage',
      itemImage = 'bandage',
      itemPrice = 1000,
      itemCategories = 'medicals'
   },

   {
      name = 'Repairkit',
      itemName = 'repairkit',
      itemImage = 'fixkit',
      itemPrice = 1000,
      itemCategories = 'tools'
   }

   -- {
   --    name = 'Orange',
   --    itemName = 'portakal',
   --    itemImage = 'portakal',
   --    itemPrice = 1000,
   --    itemCategories = 'fruits'
   -- }

   },
   [18] = { -- Config.Market  number market ---

   {
      name = 'Water',
      itemName = 'water_bottle',
      itemImage = 'water',
      itemPrice = 1000,
      itemCategories = 'drinks'
   },

   {
      name = 'Cola',
      itemName = 'kurkakola',
      itemImage = 'cola',
      itemPrice = 1000,
      itemCategories = 'drinks'
   },

   {
      name = 'Bread',
      itemName = 'sandwich',
      itemImage = 'bread',
      itemPrice = 1000,
      itemCategories = 'fastfood'
   },
   {
      name = 'Hamburger',
      itemName = 'sandwich',
      itemImage = 'hamburger',
      itemPrice = 1000,
      itemCategories = 'fastfood'
   },


   {
      name = 'Medkit',
      itemName = 'firstaid',
      itemImage = 'MedArmor',
      itemPrice = 1000,
      itemCategories = 'medicals'
   },
   {
      name = 'Bandage',
      itemName = 'bandage',
      itemImage = 'bandage',
      itemPrice = 1000,
      itemCategories = 'medicals'
   },

   {
      name = 'Repairkit',
      itemName = 'repairkit',
      itemImage = 'fixkit',
      itemPrice = 1000,
      itemCategories = 'tools'
   }

   -- {
   --    name = 'Orange',
   --    itemName = 'portakal',
   --    itemImage = 'portakal',
   --    itemPrice = 1000,
   --    itemCategories = 'fruits'
   -- }

   },
   [19] = { -- Config.Market  number market ---

   {
      name = 'Water',
      itemName = 'water_bottle',
      itemImage = 'water',
      itemPrice = 1000,
      itemCategories = 'drinks'
   },

   {
      name = 'Cola',
      itemName = 'kurkakola',
      itemImage = 'cola',
      itemPrice = 1000,
      itemCategories = 'drinks'
   },

   {
      name = 'Bread',
      itemName = 'sandwich',
      itemImage = 'bread',
      itemPrice = 1000,
      itemCategories = 'fastfood'
   },
   {
      name = 'Hamburger',
      itemName = 'sandwich',
      itemImage = 'hamburger',
      itemPrice = 1000,
      itemCategories = 'fastfood'
   },


   {
      name = 'Medkit',
      itemName = 'firstaid',
      itemImage = 'MedArmor',
      itemPrice = 1000,
      itemCategories = 'medicals'
   },
   {
      name = 'Bandage',
      itemName = 'bandage',
      itemImage = 'bandage',
      itemPrice = 1000,
      itemCategories = 'medicals'
   },

   {
      name = 'Repairkit',
      itemName = 'repairkit',
      itemImage = 'fixkit',
      itemPrice = 1000,
      itemCategories = 'tools'
   }

   -- {
   --    name = 'Orange',
   --    itemName = 'portakal',
   --    itemImage = 'portakal',
   --    itemPrice = 1000,
   --    itemCategories = 'fruits'
   -- }

   },
 


}

