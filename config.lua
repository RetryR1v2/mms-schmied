Config = {}

Config.SchmiedValentine = 'schmiedvalentine'
Config.SchmiedRhodes = 'schmiedrhodes'
Config.SchmiedBlackwater = 'schmiedblackwater'
Config.SchmiedSaintDenise = 'schmiedsaintdenise'

Config.Valentine = {
    {
        shop = 'Valentine',
        lable = 'Schmied Valentine',
        name = 'Schmied Valentine',
        coords = vector3(-369.02, 796.14, 116.25),  ---- next to Stable in Valentine
        showblip = true,
        blipName = 'Schmied Valentine',
        blipSprite = 'blip_shop_blacksmith',
        blipScale = 4.5
    },
}
Config.Rhodes = {
    {
        shop = 'Rhodes',
        lable = 'Schmied Rhodes',
        name = 'Schmied Rhodes',
        coords = vector3(496.40, 672.96, 121.09),  ---- Random Location not set yet
        showblip = true,
        blipName = 'Schmied Rhodes',
        blipSprite = 'blip_shop_blacksmith',
        blipScale = 4.5
    },
}
Config.Blackwater = {
    {
        shop = 'Blackwater',
        lable = 'Schmied Blackwater',
        name = 'Schmied Blackwater',
        coords = vector3(496.40, 672.96, 121.09),   ---- Random Location not set yet
        showblip = true,
        blipName = 'Schmied Valentine',
        blipSprite = 'blip_shop_blacksmith',
        blipScale = 4.5
    },
}
Config.SaintDenise = {
    {
        shop = 'SaintDenise',
        lable = 'Schmied SaintDenise',
        name = 'Schmied SaintDenise',
        coords = vector3(496.40, 672.96, 121.09),   ---- Random Location not set yet
        showblip = true,
        blipName = 'Schmied SaintDenise',
        blipSprite = 'blip_shop_blacksmith',
        blipScale = 4.5
    },
}

Config.CraftTime = 8000

Config.Reciepes = {
    {
        title =  'Kupfer',
        material = { 
            [1] = { item = 'copper_ore',     amount = 5 },
            [2] = { item = 'coal',      amount = 5 },
        },
        receive = 'copper',
        giveamount = 3
    },
    {
        title =  'Eisen',
        material = { 
            [1] = { item = 'iron_ore',     amount = 5 },
            [2] = { item = 'coal',      amount = 5 },
        },
        receive = 'iron',
        giveamount = 3
    },
    {
        title =  'Stahl',
        material = { 
            [1] = { item = 'steel_ore',     amount = 5 },
            [2] = { item = 'coal',      amount = 5 },
        },
        receive = 'iron',
        giveamount = 3
    },
    {
        title =  'Aluminum',
        material = { 
            [1] = { item = 'aluminum_ore',     amount = 5 },
            [2] = { item = 'coal',      amount = 5 },
        },
        receive = 'aluminum',
        giveamount = 3
    },
    {
        title =  'Schaufel',
        material = { 
            [1] = { item = "iron",     amount = 3 },
            [2] = { item = "wood",      amount = 1 },
        },
        receive = "shovel",
        giveamount = 1
    },
    {
        title =  'Spitzhacke',
        material = { 
            [1] = { item = "iron",     amount = 3 },
            [2] = { item = "wood",      amount = 1 },
        },
        receive = "pickaxe",
        giveamount = 1
    },
    {
        title =  'Axt',
        material = { 
            [1] = { item = "iron",     amount = 3 },
            [2] = { item = "wood",      amount = 1 },
        },
        receive = 'axe',
        giveamount = 1
    },
    {
        title =  'Abzug',
        material = { 
            [1] = { item = "steel",     amount = 2 },
            [2] = { item = "copper",      amount = 2 },
        },
        receive = 'trigger',
        giveamount = 1
    },
    {
        title =  'Hammer',
        material = { 
            [1] = { item = "steel",     amount = 2 },
            [2] = { item = "copper",      amount = 2 },
        },
        receive = 'hammer',
        giveamount = 1
    },
    {
        title =  'Lauf',
        material = { 
            [1] = { item = "steel",     amount = 2 },
            [2] = { item = "copper",      amount = 2 },
        },
        receive = 'barrel',
        giveamount = 1
    },
    {
        title =  'Feder',
        material = { 
            [1] = { item = "steel",     amount = 2 },
            [2] = { item = "copper",      amount = 2 },
        },
        receive = 'spring',
        giveamount = 1
    },
    {
        title =  'Rahmen',
        material = { 
            [1] = { item = "steel",     amount = 2 },
            [2] = { item = "copper",      amount = 2 },
        },
        receive = 'frame',
        giveamount = 1
    },
    {
        title =  'Griff',
        material = { 
            [1] = { item = "wood",     amount = 2 },
            [2] = { item = 'aluminum',      amount = 2 },
        },
        receive = 'grip',
        giveamount = 1
    },
    {
        title =  'Zylinder',
        material = { 
            [1] = { item = "steel",     amount = 2 },
            [2] = { item = "copper",      amount = 2 },
        },
        receive = 'cylinder',
        giveamount = 1
    },
    {
        title =  'Magazin',
        material = { 
            [1] = { item = "steel",     amount = 2 },
            [2] = { item = "copper",      amount = 2 },
        },
        receive = 'stock',
        giveamount = 1
    },
    {
        title =  'Visir',
        material = { 
            [1] = { item = "steel",     amount = 2 },
            [2] = { item = "copper",      amount = 2 },
        },
        receive = 'sight',
        giveamount = 1
    },
    {
        title =  'Schlagbolzen',
        material = { 
            [1] = { item = "steel",     amount = 2 },
            [2] = { item = "copper",      amount = 2 },
        },
        receive = 'bolt',
        giveamount = 1
    },
    {
        title =  'Band',
        material = { 
            [1] = { item = "steel",     amount = 2 },
            [2] = { item = "copper",      amount = 2 },
        },
        receive = 'sling',
        giveamount = 1
    },
    {
        title =  'Auslöser',
        material = { 
            [1] = { item = "steel",     amount = 2 },
            [2] = { item = "copper",      amount = 2 },
        },
        receive = 'action',
        giveamount = 1
    },




 }