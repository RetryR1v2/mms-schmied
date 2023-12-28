local RSGCore = exports['rsg-core']:GetCoreObject()
local FeatherMenu =  exports['feather-menu'].initiate()
local PlayerData = RSGCore.Functions.GetPlayerData()
local isLoggedIn = false

RegisterNetEvent('RSGCore:Client:OnPlayerLoaded')
AddEventHandler('RSGCore:Client:OnPlayerLoaded', function()
    Citizen.Wait(1000)
    local PlayerData = RSGCore.Functions.GetPlayerData()
    playerjob = PlayerData.job.name 
Citizen.CreateThread(function()
    if playerjob == Config.SchmiedValentine or playerjob == Config.SchmiedSaintDenise or playerjob == Config.SchmiedRhodes or playerjob == Config.SchmiedBlackwater then
        if playerjob == Config.SchmiedValentine then
            for SchmiedVal,v in pairs(Config.Valentine) do
                exports['rsg-core']:createPrompt(v.name, v.coords, RSGCore.Shared.Keybinds['J'],  (' ') .. v.lable, {
                    type = 'client',
                    event = 'mms-schmiede:client:schmiedemenü',
                    args = {},
                })
                if v.showblip == true then
                    local SchmiedVal = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, v.coords)
                    SetBlipSprite(SchmiedVal, GetHashKey(v.blipSprite), true)
                    SetBlipScale(SchmiedVal, v.blipScale)
                    Citizen.InvokeNative(0x9CB1A1623062F402, SchmiedVal, v.blipName)
                end
            
        end
    elseif playerjob == Config.SchmiedRhodes then
        for SchmiedRho,v in pairs(Config.Rhodes) do
            exports['rsg-core']:createPrompt(v.name, v.coords, RSGCore.Shared.Keybinds['J'],  (' ') .. v.lable, {
                type = 'client',
                event = 'mms-schmiede:client:schmiedemenü',
                args = {},
            })
            if v.showblip == true then
                local SchmiedRho = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, v.coords)
                SetBlipSprite(SchmiedRho, GetHashKey(v.blipSprite), true)
                SetBlipScale(SchmiedRho, v.blipScale)
                Citizen.InvokeNative(0x9CB1A1623062F402, SchmiedRho, v.blipName)
            end
            
    end
elseif playerjob == Config.SchmiedBlackwater then
    for SchmiedBlk,v in pairs(Config.Blackwater) do
        exports['rsg-core']:createPrompt(v.name, v.coords, RSGCore.Shared.Keybinds['J'],  (' ') .. v.lable, {
            type = 'client',
            event = 'mms-schmiede:client:schmiedemenü',
            args = {},
        })
        if v.showblip == true then
            local SchmiedBlk = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, v.coords)
            SetBlipSprite(SchmiedBlk, GetHashKey(v.blipSprite), true)
            SetBlipScale(SchmiedBlk, v.blipScale)
            Citizen.InvokeNative(0x9CB1A1623062F402, SchmiedBlk, v.blipName)
        end
        
    end
elseif playerjob == Config.SchmiedSaintDenise then
    for SchmiedStdn,v in pairs(Config.SaintDenise) do
        exports['rsg-core']:createPrompt(v.name, v.coords, RSGCore.Shared.Keybinds['J'],  (' ') .. v.lable, {
            type = 'client',
            event = 'mms-schmiede:client:schmiedemenü',
            args = {},
        })
        if v.showblip == true then
            local SchmiedStdn = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, v.coords)
            SetBlipSprite(SchmiedStdn, GetHashKey(v.blipSprite), true)
            SetBlipScale(SchmiedStdn, v.blipScale)
            Citizen.InvokeNative(0x9CB1A1623062F402, SchmiedStdn, v.blipName)
        end
       
    end

end
end

Schmiede = FeatherMenu:RegisterMenu('feather:character:schmiedemenu', {
    top = '50%',
    left = '50%',
    ['720width'] = '500px',
    ['1080width'] = '700px',
    ['2kwidth'] = '700px',
    ['4kwidth'] = '8000px',
    style = {
        ['border'] = '5px solid orange',
        -- ['background-image'] = 'none',
        ['background-color'] = '#FF8C00'
    },
    contentslot = {
        style = {
            ['height'] = '550px',
            ['min-height'] = '550px'
        }
    },
    draggable = true,
})
SchmiedePage1 = Schmiede:RegisterPage('first:schmiede')
SchmiedePage1:RegisterElement('header', {
    value = 'Schmiede',
    slot = "header",
    style = {
        ['color'] = 'orange',
    }
})
SchmiedePage1:RegisterElement('line', {
    slot = "header",
    style = {
        ['color'] = 'orange',
    }
})
SchmiedePage1:RegisterElement('button', {
    label = "Herstellen",
    style = {
        ['background-color'] = '#FF8C00',
        ['color'] = 'orange',
        ['border-radius'] = '6px'
    },
}, function()
    TriggerEvent('mms-schmiede:client:herstellungmenü')
end)
SchmiedePage1:RegisterElement('button', {
    label = "Firmenkonto",
    style = {
        ['background-color'] = '#FF8C00',
        ['color'] = 'orange',
        ['border-radius'] = '6px'
    },
}, function()
    TriggerEvent('mms-schmiede:client:kontomenü')
    TriggerEvent('mms-schmied:client:update')
end)
SchmiedePage1:RegisterElement('button', {
    label = "Schmiede Lager",
    style = {
        ['background-color'] = '#FF8C00',
        ['color'] = 'orange',
        ['border-radius'] = '6px'
    },
}, function()
    TriggerEvent('mms-schmied:client:lager')
    Schmiede:Close({ 
    })
end)
SchmiedePage1:RegisterElement('button', {
    label = "Schmiede Schließen",
    style = {
        ['background-color'] = '#FF8C00',
        ['color'] = 'orange',
        ['border-radius'] = '6px'
    },
}, function()
    Schmiede:Close({ 
    })
end)
SchmiedePage1:RegisterElement('subheader', {
    value = "Schmiede",
    slot = "footer",
    style = {
        ['color'] = 'orange',
    }
})
SchmiedePage1:RegisterElement('line', {
    slot = "footer",
    style = {
        ['color'] = 'orange',
    }
})

end)

RegisterNetEvent('mms-schmiede:client:schmiedemenü',function()
    --local ped = PlayerPedId()
    --Citizen.InvokeNative(0xB31A277C1AC7B7FF, ped, 0, 0, -1169051375, 1, 1, 0, 0)
    --Citizen.InvokeNative(0xB31A277C1AC7B7FF, ped, 0, 0, -919436740, 1, 1, 0, 0)
    Schmiede:Open({
        startupPage = SchmiedePage1,
    })
end)
RegisterNetEvent('mms-schmiede:client:herstellungmenü',function()
    --local ped = PlayerPedId()
    --Citizen.InvokeNative(0xB31A277C1AC7B7FF, ped, 0, 0, -1169051375, 1, 1, 0, 0)
    --Citizen.InvokeNative(0xB31A277C1AC7B7FF, ped, 0, 0, -919436740, 1, 1, 0, 0)
    Herstellung:Open({
        startupPage = HerstellungPage1,
    })
end)
RegisterNetEvent('mms-schmiede:client:kontomenü',function()
    --local ped = PlayerPedId()
    --Citizen.InvokeNative(0xB31A277C1AC7B7FF, ped, 0, 0, -1169051375, 1, 1, 0, 0)
    --Citizen.InvokeNative(0xB31A277C1AC7B7FF, ped, 0, 0, -919436740, 1, 1, 0, 0)
    Firmenkonto:Open({
        startupPage = FirmenkontoPage1,
    })
end)



--for _, mail in ipairs(eintraege) do
   -- local buttonLabel = 'ID:  '.. mail.id ..' Titel:  '.. mail.titel
Citizen.CreateThread(function()
        Herstellung = FeatherMenu:RegisterMenu('feather:character:Herstellungsmenu', {
            top = '50%',
            left = '50%',
            ['720width'] = '500px',
            ['1080width'] = '700px',
            ['2kwidth'] = '700px',
            ['4kwidth'] = '8000px',
            style = {
                ['border'] = '5px solid orange',
                -- ['background-image'] = 'none',
                ['background-color'] = '#FF8C00'
            },
            contentslot = {
                style = {
                    ['height'] = '550px',
                    ['min-height'] = '550px'
                }
            },
            draggable = true,
        })
        HerstellungPage1 = Herstellung:RegisterPage('first:herstellung')
        HerstellungPage1:RegisterElement('header', {
            value = 'Herstellung',
            slot = "header",
            style = {
                ['color'] = 'orange',
            }
        })
        HerstellungPage1:RegisterElement('line', {
            slot = "header",
            style = {
                ['color'] = 'orange',
            }
        })
        for _, recipe in ipairs(Config.Reciepes) do
            local title = recipe.title
            local ingredientsText = "Rezept für " .. title .. ":\n"

            for _, ingredient in ipairs(recipe.material) do
                local ingredientLabel = RSGCore.Shared.Items[ingredient.item].label
                local ingredientAmount = ingredient.amount
                ingredientsText = ingredientsText .. ingredientLabel .. ": " .. ingredientAmount .. "\n"
            end
            HerstellungPage1:RegisterElement('textdisplay', {
                value = ingredientsText,
                style = {}
            })
        
            HerstellungPage1:RegisterElement('button', {
                label = title .." Herstellen",
                style = {
                    ['background-color'] = '#FF8C00',
                    ['color'] = 'orange',
                    ['border-radius'] = '6px'
                },
            }, function()
                    TriggerEvent('mms-schmied:client:crafting' ,title)
            end)
        
        end
        HerstellungPage1:RegisterElement('button', {
            label = "Zurück",
            style = {
                ['background-color'] = '#FF8C00',
                ['color'] = 'orange',
                ['border-radius'] = '6px'
            },
        }, function()
            Herstellung:Close({ 
            })
            TriggerEvent('mms-schmiede:client:schmiedemenü')
        end)
        HerstellungPage1:RegisterElement('button', {
            label = "Schmiede Schließen",
            style = {
                ['background-color'] = '#FF8C00',
                ['color'] = 'orange',
                ['border-radius'] = '6px'
            },
        }, function()
            Herstellung:Close({ 
            })
        end)
        HerstellungPage1:RegisterElement('subheader', {
            value = "Schmiede",
            slot = "footer",
            style = {
                ['color'] = 'orange',
            }
        })
        HerstellungPage1:RegisterElement('line', {
            slot = "footer",
            style = {
                ['color'] = 'orange',
            }
        })
    
 
end)

Citizen.CreateThread(function()
Firmenkonto = FeatherMenu:RegisterMenu('feather:character:firmenkontomenu', {
    top = '50%',
    left = '50%',
    ['720width'] = '500px',
    ['1080width'] = '700px',
    ['2kwidth'] = '700px',
    ['4kwidth'] = '8000px',
    style = {
        ['border'] = '5px solid orange',
        -- ['background-image'] = 'none',
        ['background-color'] = '#FF8C00'
    },
    contentslot = {
        style = {
            ['height'] = '550px',
            ['min-height'] = '550px'
        }
    },
    draggable = true,
})
FirmenkontoPage1 = Firmenkonto:RegisterPage('first:schmiede')
FirmenkontoPage1:RegisterElement('header', {
    value = 'Firmenkonto',
    slot = "header",
    style = {
        ['color'] = 'orange',
    }
})
FirmenkontoPage1:RegisterElement('line', {
    slot = "header",
    style = {
        ['color'] = 'orange',
    }
})
if playerjob == Config.SchmiedSaintDenise then
    Kontostandstdn = FirmenkontoPage1:RegisterElement('textdisplay', {
        value = '$' ,
        style = {}
})
elseif playerjob == Config.SchmiedValentine then
    Kontostandval = FirmenkontoPage1:RegisterElement('textdisplay', {
        value = '$' ,
        style = {}
    })
elseif playerjob == Config.SchmiedBlackwater then
    Kontostandblk = FirmenkontoPage1:RegisterElement('textdisplay', {
        value = '$' ,
        style = {}
    })
elseif playerjob == Config.SchmiedRhodes then
    Kontostandrho = FirmenkontoPage1:RegisterElement('textdisplay', {
        value = '$' ,
        style = {}
    })
end
local inputValue = ''
FirmenkontoPage1:RegisterElement('input', {
    label = "Wie Viel?:",
    placeholder = "0 $",
    style = {
        ['background-color'] = '#FF8C00',
        ['color'] = 'orange',
        ['border-radius'] = '6px'
    }
}, function(data)
    inputValue = data.value
end)
FirmenkontoPage1:RegisterElement('button', {
    label = "Geld Einzahlen",
    style = {
        ['background-color'] = '#FF8C00',
        ['color'] = 'orange',
        ['border-radius'] = '6px'
    },
}, function()
    TriggerEvent('mms-schmiede:client:geldeinzahlen', inputValue)
    Firmenkonto:Close({ 
    })
    TriggerEvent('mms-schmiede:client:schmiedemenü')
end)
FirmenkontoPage1:RegisterElement('button', {
    label = "Geld Auszahlen",
    style = {
        ['background-color'] = '#FF8C00',
        ['color'] = 'orange',
        ['border-radius'] = '6px'
    },
}, function()
    TriggerEvent('mms-schmiede:client:geldauszahlen', inputValue)
    Firmenkonto:Close({ 
    })
    TriggerEvent('mms-schmiede:client:schmiedemenü')
end)

FirmenkontoPage1:RegisterElement('button', {
    label = "Firmenkonto Schließen",
    style = {
        ['background-color'] = '#FF8C00',
        ['color'] = 'orange',
        ['border-radius'] = '6px'
    },
}, function()
    Firmenkonto:Close({ 
    })
end)
FirmenkontoPage1:RegisterElement('subheader', {
    value = "Firmenkonto",
    slot = "footer",
    style = {
        ['color'] = 'orange',
    }
})
FirmenkontoPage1:RegisterElement('line', {
    slot = "footer",
    style = {
        ['color'] = 'orange',
    }
})

end)


---- Kontostände Erstellen
Citizen.CreateThread(function ()
    Citizen.Wait(200)
    TriggerServerEvent('mms-schmiede:server:kontoerstellen')
end)

end)

RegisterNetEvent('mms-schmied:client:updatestdn')
AddEventHandler('mms-schmied:client:updatestdn',function(kontostandstdn)
    if playerjob == Config.SchmiedSaintDenise then
    Kontostandstdn:update({
        value = kontostandstdn .. '$',
        style = {}
    })
    end
end)

RegisterNetEvent('mms-schmied:client:updateval')
AddEventHandler('mms-schmied:client:updateval',function(kontostandval)
    if playerjob == Config.SchmiedValentine then
    Kontostandval:update({
        value = kontostandval .. '$',
        style = {}
    })
end
end)
RegisterNetEvent('mms-schmied:client:updateblk')
AddEventHandler('mms-schmied:client:updateblk',function(kontostandblk)
    if playerjob == Config.SchmiedBlackwater then
    Kontostandblk:update({
        value = kontostandblk .. '$',
        style = {}
    })
end
end)
RegisterNetEvent('mms-schmied:client:updaterho')
AddEventHandler('mms-schmied:client:updaterho',function(kontostandrho)
    if playerjob == Config.SchmiedRhodes then
    Kontostandrho:update({
        value = kontostandrho .. '$',
        style = {}
    })
end
end)


RegisterNetEvent('mms-schmied:client:update')
AddEventHandler('mms-schmied:client:update',function()
        Citizen.Wait(100)
        TriggerServerEvent('mms-schmiede:server:updatekontostand',playerjob)
end)

RegisterNetEvent('mms-schmiede:client:geldeinzahlen')
AddEventHandler('mms-schmiede:client:geldeinzahlen',function(inputValue)
    local anzahl = tonumber(inputValue)
    TriggerServerEvent('mms-schmied:server:geldeinzahlen',playerjob,anzahl)
end)

RegisterNetEvent('mms-schmiede:client:geldauszahlen')
AddEventHandler('mms-schmiede:client:geldauszahlen',function(inputValue)
    local anzahl = tonumber(inputValue)
    TriggerServerEvent('mms-schmied:server:geldauszahlen',playerjob,anzahl)
end)



RegisterNetEvent('mms-schmied:client:lager')
AddEventHandler('mms-schmied:client:lager',function()
    TriggerServerEvent('inventory:server:OpenInventory', 'stash', 'Lager_' .. playerjob, {
        maxweight = 2500000,
        slots = 40,
    })
    TriggerEvent('inventory:client:SetCurrentStash', 'Lager_' .. playerjob)
end)




RegisterNetEvent('mms-schmied:client:crafting')
AddEventHandler('mms-schmied:client:crafting',function(title)
    TriggerServerEvent('mms-schmied:server:craftingcheckitems',title)
end)

RegisterNetEvent('mms-schmied:client:finishcrafting')
AddEventHandler('mms-schmied:client:finishcrafting',function(title)
    local ped = PlayerPedId()
    Citizen.InvokeNative(0xB31A277C1AC7B7FF, ped, 0, 0, -415456998, 1, 1, 0, 0)
    RSGCore.Functions.Progressbar('Stelle Her!','Stelle Her!',Config.CraftTime, false, true, {
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
    end)
    TriggerServerEvent('mms-schmied:server:craftingfinish',title)
end)
