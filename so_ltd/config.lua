local Config <const> = {
   interact = "ox", -- "so" or "ox"
   shops = {
      {
        name = "Open LTD",
        coords = vec3(25.204233169556, -1347.3911132812, 29.697849273682),
         blips = {
               blipSprite = 59,
               blipColour = 2,
               blipScale = 0.6,
               blipDisplay = 4,
               blipLabel = "LTD 24/7",
               blipCoords = vec3(25.204233169556, -1347.3911132812, 29.697849273682)
         },
        items = {
            {label = "Water", name = "water", price = 3, image = "https://cfx-nui-ox_inventory/web/images/water.png"},
            {label = "Burger", name = "burger", price = 5, image = "https://cfx-nui-ox_inventory/web/images/burger.png"},
            {label = "Water", name = "water", price = 3, image = "https://cfx-nui-ox_inventory/web/images/water.png"},
            {label = "Burger", name = "burger", price = 5, image = "https://cfx-nui-ox_inventory/web/images/burger.png"},
            {label = "Water", name = "water", price = 3, image = "https://cfx-nui-ox_inventory/web/images/water.png"},
            {label = "Burger", name = "burger", price = 5, image = "https://cfx-nui-ox_inventory/web/images/burger.png"},
            {label = "Water", name = "water", price = 3, image = "https://cfx-nui-ox_inventory/web/images/water.png"},
            {label = "Burger", name = "burger", price = 5, image = "https://cfx-nui-ox_inventory/web/images/burger.png"},
        }
      },
      
   },
}
_ENV.Config = Config