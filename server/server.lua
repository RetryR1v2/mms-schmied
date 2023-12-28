local RSGCore = exports['rsg-core']:GetCoreObject()

-----------------------------------------------------------------------
-- version checker
-----------------------------------------------------------------------
local function versionCheckPrint(_type, log)
    local color = _type == 'success' and '^2' or '^1'

    print(('^5['..GetCurrentResourceName()..']%s %s^7'):format(color, log))
end

local function CheckVersion()
    PerformHttpRequest('https://raw.githubusercontent.com/RetryR1v2/mms-schmied/main/version.txt', function(err, text, headers)
        local currentVersion = GetResourceMetadata(GetCurrentResourceName(), 'version')

        if not text then 
            versionCheckPrint('error', 'Currently unable to run a version check.')
            return 
        end

      
        if text == currentVersion then
            versionCheckPrint('success', 'You are running the latest version.')
        else
            versionCheckPrint('error', ('Current Version: %s'):format(currentVersion))
            versionCheckPrint('success', ('Latest Version: %s'):format(text))
            versionCheckPrint('error', ('You are currently running an outdated version, please update to version %s'):format(text))
        end
    end)
end


---- kontostände Erstellen
RegisterServerEvent('mms-schmiede:server:kontoerstellen', function()
    MySQL.query('SELECT `kontostand` FROM mms_schmied WHERE beruf = ?',{Config.SchmiedBlackwater} , function(result)
        if result[1] == nil then
            MySQL.insert('INSERT INTO mms_schmied (`beruf`, `kontostand`) VALUES (?, ?);', {Config.SchmiedBlackwater, 0})
            --print('Geschäftskonto Schmiede Blackwater Konto Erstellt')
        elseif result[1].kontostand >= 0 then
            --print('Geschäftskonto Schmiede Blackwater Existiert bereits')
        end
    end)
    MySQL.query('SELECT `kontostand` FROM mms_schmied WHERE beruf = ?',{Config.SchmiedRhodes} , function(result)
        if result[1] == nil then
            MySQL.insert('INSERT INTO mms_schmied (`beruf`, `kontostand`) VALUES (?, ?);', {Config.SchmiedRhodes, 0})
            --print('Geschäftskonto Schmiede Rhodes Konto Erstellt')
        elseif result[1].kontostand >= 0 then
            --print('Geschäftskonto Schmiede Rhodes Existiert bereits')
        end

    end)
    MySQL.query('SELECT `kontostand` FROM mms_schmied WHERE beruf = ?',{Config.SchmiedValentine} , function(result)
        if result[1] == nil then
            MySQL.insert('INSERT INTO mms_schmied (`beruf`, `kontostand`) VALUES (?, ?);', {Config.SchmiedValentine, 0})
           -- print('Geschäftskonto Schmiede Valentine Konto Erstellt')
        elseif result[1].kontostand >= 0 then
           -- print('Geschäftskonto Schmiede Valentine Existiert bereits')
        end
    end)
    MySQL.query('SELECT `kontostand` FROM mms_schmied WHERE beruf = ?',{Config.SchmiedSaintDenise} , function(result)
        if result[1] == nil then
            MySQL.insert('INSERT INTO mms_schmied (`beruf`, `kontostand`) VALUES (?, ?);', {Config.SchmiedSaintDenise, 0})
            --print('Geschäftskonto Schmiede Saint Denise Konto Erstellt')
        elseif result[1].kontostand >= 0  then
            --print('Geschäftskonto Schmiede Saint Denise Existiert bereits')
        end
    end)
end)

RegisterServerEvent('mms-schmiede:server:updatekontostand', function(playerjob)
    local src = source
    if playerjob == Config.SchmiedSaintDenise then
    MySQL.query('SELECT `kontostand` FROM mms_schmied WHERE beruf = ?',{Config.SchmiedSaintDenise} , function(result)
        if  result[1].kontostand >= 0 then
            local kontostandstdn = result[1].kontostand
            TriggerClientEvent('mms-schmied:client:updatestdn',src,kontostandstdn)
        end
    end)
elseif playerjob == Config.SchmiedBlackwater then
    MySQL.query('SELECT `kontostand` FROM mms_schmied WHERE beruf = ?',{Config.SchmiedBlackwater} , function(result)
        if result[1].kontostand >= 0 then
            local kontostandblk = result[1].kontostand
            TriggerClientEvent('mms-schmied:client:updateblk',src,kontostandblk)
        end
    end)
    elseif playerjob == Config.SchmiedValentine then
    MySQL.query('SELECT `kontostand` FROM mms_schmied WHERE beruf = ?',{Config.SchmiedValentine} , function(result)
        if  result[1].kontostand >= 0 then
            local kontostandval = result[1].kontostand
            TriggerClientEvent('mms-schmied:client:updateval',src,kontostandval)
        end
    end)
    elseif playerjob == Config.SchmiedRhodes then      
    MySQL.query('SELECT `kontostand` FROM mms_schmied WHERE beruf = ?',{Config.SchmiedRhodes} , function(result)
        if result[1].kontostand >= 0 then
            local kontostandrho = result[1].kontostand
            TriggerClientEvent('mms-schmied:client:updaterho',src,kontostandrho)
        end
    end)
end
end)



---------- EIN UND AUSZAHLUNG
RegisterServerEvent('mms-schmied:server:geldeinzahlen', function(playerjob, anzahl)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    if Player.Functions.GetMoney('cash') >= anzahl then
    if playerjob == Config.SchmiedSaintDenise then
    MySQL.query('SELECT `kontostand` FROM mms_schmied WHERE beruf = ?',{Config.SchmiedSaintDenise} , function(result)
        if  result[1].kontostand >= 0 then
            local newvalue = result[1].kontostand + anzahl
            MySQL.update('UPDATE mms_schmied SET kontostand = ? WHERE beruf = ?',{newvalue,playerjob})
            TriggerClientEvent('ox_lib:notify', src, {title = 'Du hast ' .. anzahl .. ' $ in das Geschäftskonto eingezahlt!', description =  'Eingezahlt', type = 'success', duration = 5000 })
        end
    end)
elseif playerjob == Config.SchmiedBlackwater then
    MySQL.query('SELECT `kontostand` FROM mms_schmied WHERE beruf = ?',{Config.SchmiedBlackwater} , function(result)
        if result[1].kontostand >= 0 then
            local newvalue = result[1].kontostand + anzahl
            MySQL.update('UPDATE mms_schmied SET kontostand = ? WHERE beruf = ?',{newvalue,playerjob})
            TriggerClientEvent('ox_lib:notify', src, {title = 'Du hast ' .. anzahl .. ' $ in das Geschäftskonto eingezahlt!', description =  'Eingezahlt', type = 'success', duration = 5000 })
        end
    end)
    elseif playerjob == Config.SchmiedValentine then
    MySQL.query('SELECT `kontostand` FROM mms_schmied WHERE beruf = ?',{Config.SchmiedValentine} , function(result)
        if  result[1].kontostand >= 0 then
            local newvalue = result[1].kontostand + anzahl
            MySQL.update('UPDATE mms_schmied SET kontostand = ? WHERE beruf = ?',{newvalue,playerjob})
            TriggerClientEvent('ox_lib:notify', src, {title = 'Du hast ' .. anzahl .. ' $ in das Geschäftskonto eingezahlt!', description =  'Eingezahlt', type = 'success', duration = 5000 })
        
        end
    end)
    elseif playerjob == Config.SchmiedRhodes then      
    MySQL.query('SELECT `kontostand` FROM mms_schmied WHERE beruf = ?',{Config.SchmiedRhodes} , function(result)
        if result[1].kontostand >= 0 then
            local newvalue = result[1].kontostand + anzahl
            MySQL.update('UPDATE mms_schmied SET kontostand = ? WHERE beruf = ?',{newvalue,playerjob})
            TriggerClientEvent('ox_lib:notify', src, {title = 'Du hast ' .. anzahl .. ' $ in das Geschäftskonto eingezahlt!', description =  'Eingezahlt', type = 'success', duration = 5000 })
        end
    end)
else
    TriggerClientEvent('ox_lib:notify', src, {title = 'Du hast nicht genug Geld zum Einzahlen!', description =  'Fehler', type = 'error', duration = 5000 })
end
end
end)

RegisterServerEvent('mms-schmied:server:geldauszahlen', function(playerjob,anzahl)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    if playerjob == Config.SchmiedSaintDenise then
    MySQL.query('SELECT `kontostand` FROM mms_schmied WHERE beruf = ?',{Config.SchmiedSaintDenise} , function(result)
        if  result[1].kontostand >= anzahl then
            local newvalue = result[1].kontostand - anzahl
            MySQL.update('UPDATE mms_schmied SET kontostand = ? WHERE beruf = ?',{newvalue,playerjob})
            Player.Functions.AddMoney('cash', anzahl)
            TriggerClientEvent('ox_lib:notify', src, {title = 'Du hast ' .. anzahl .. ' $ vom Geschäftskonto abgehoben!', description =  'Ausgezahlt', type = 'success', duration = 5000 })
        else
            TriggerClientEvent('ox_lib:notify', src, {title = 'Du hast nicht genug Geld auf dem Geschäftskonto!', description =  'Fehler', type = 'error', duration = 5000 })
        end
    end)
elseif playerjob == Config.SchmiedBlackwater then
    MySQL.query('SELECT `kontostand` FROM mms_schmied WHERE beruf = ?',{Config.SchmiedBlackwater} , function(result)
        if result[1].kontostand >= anzahl then
            local newvalue = result[1].kontostand - anzahl
            MySQL.update('UPDATE mms_schmied SET kontostand = ? WHERE beruf = ?',{newvalue,playerjob})
            Player.Functions.AddMoney('cash', anzahl)
            TriggerClientEvent('ox_lib:notify', src, {title = 'Du hast ' .. anzahl .. ' $ vom Geschäftskonto abgehoben!', description =  'Ausgezahlt', type = 'success', duration = 5000 })
        else
            TriggerClientEvent('ox_lib:notify', src, {title = 'Du hast nicht genug Geld auf dem Geschäftskonto!', description =  'Fehler', type = 'error', duration = 5000 })
        end
    end)
    elseif playerjob == Config.SchmiedValentine then
    MySQL.query('SELECT `kontostand` FROM mms_schmied WHERE beruf = ?',{Config.SchmiedValentine} , function(result)
        if  result[1].kontostand >= anzahl then
            local newvalue = result[1].kontostand - anzahl
            MySQL.update('UPDATE mms_schmied SET kontostand = ? WHERE beruf = ?',{newvalue,playerjob})
            Player.Functions.AddMoney('cash', anzahl)
            TriggerClientEvent('ox_lib:notify', src, {title = 'Du hast ' .. anzahl .. ' $ vom Geschäftskonto abgehoben!', description =  'Ausgezahlt', type = 'success', duration = 5000 })
        else
            TriggerClientEvent('ox_lib:notify', src, {title = 'Du hast nicht genug Geld auf dem Geschäftskonto!', description =  'Fehler', type = 'error', duration = 5000 })
        end
        
    end)
    elseif playerjob == Config.SchmiedRhodes then
    MySQL.query('SELECT `kontostand` FROM mms_schmied WHERE beruf = ?',{Config.SchmiedRhodes} , function(result)
        if result[1].kontostand >= anzahl then
            local newvalue = result[1].kontostand - anzahl
            MySQL.update('UPDATE mms_schmied SET kontostand = ? WHERE beruf = ?',{newvalue,playerjob})
            Player.Functions.AddMoney('cash', anzahl)
            TriggerClientEvent('ox_lib:notify', src, {title = 'Du hast ' .. anzahl .. ' $ vom Geschäftskonto abgehoben!', description =  'Ausgezahlt', type = 'success', duration = 5000 })
        else
            TriggerClientEvent('ox_lib:notify', src, {title = 'Du hast nicht genug Geld auf dem Geschäftskonto!', description =  'Fehler', type = 'error', duration = 5000 })
        end
    end)
end
end)



RegisterServerEvent('mms-schmied:server:craftingcheckitems', function(title)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
for _, recipe in ipairs(Config.Reciepes) do
    if recipe.title == title then
        local itemVariables = {}
        local amountVariables = {}

        -- Schleife durch alle Materialien im Rezept
        for index, material in ipairs(recipe.material) do
            itemVariables[index] = material.item
            amountVariables[index] = material.amount
        end

        -- Setze die Werte in Variablen item1, amountItem1, item2, amountItem2, ...
        for i = 1, #itemVariables do
            if Player.Functions.GetItemByName(itemVariables[i]) and Player.Functions.GetItemByName(itemVariables[i]).amount >= amountVariables[i] then
            else
                TriggerClientEvent('ox_lib:notify', src, {title = 'Du hast nicht alle zutaten!', description =  'Material Fehlt', type = 'error',  duration = 5000 })
                goto continue
            end
        end
        TriggerClientEvent('mms-schmied:client:finishcrafting',src,title)
    end
    ::continue::
end
end)

RegisterServerEvent('mms-schmied:server:craftingfinish', function(title)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
for _, recipe in ipairs(Config.Reciepes) do
    if recipe.title == title then
        local itemVariables = {}
        local amountVariables = {}

        -- Schleife durch alle Materialien im Rezept
        for index, material in ipairs(recipe.material) do
            itemVariables[index] = material.item
            amountVariables[index] = material.amount
        end

        -- Setze die Werte in Variablen item1, amountItem1, item2, amountItem2, ...
        for i = 1, #itemVariables do
            if Player.Functions.GetItemByName(itemVariables[i]) and Player.Functions.GetItemByName(itemVariables[i]).amount >= amountVariables[i] then
                Player.Functions.RemoveItem(itemVariables[i], amountVariables[i])
                TriggerClientEvent("inventory:client:ItemBox", src, RSGCore.Shared.Items[itemVariables[i]], "remove")
                
            else
                TriggerClientEvent('ox_lib:notify', src, {title = 'Du hast nicht alle zutaten!', description =  'Material Fehlt', type = 'error',  duration = 5000 })
            end
        end
        Player.Functions.AddItem(recipe.receive, recipe.giveamount)
        TriggerClientEvent("inventory:client:ItemBox", src, RSGCore.Shared.Items[recipe.receive], "add")
    end
end
end)


        --Player.Functions.RemoveItem('weed', Config.ReciepeWeedNeeded * anzahl)
        --Player.Functions.AddItem('joint', Config.ReciepeJointReward * anzahl)
        --TriggerClientEvent("inventory:client:ItemBox", src, RSGCore.Shared.Items['weed'], "remove")
        --TriggerClientEvent("inventory:client:ItemBox", src, RSGCore.Shared.Items['joint'], "add")
--------------------------------------------------------------------------------------------------
-- start version check
--------------------------------------------------------------------------------------------------
CheckVersion()