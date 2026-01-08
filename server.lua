local isActive = false

local function NotifyPlayer(source, title, description)
    lib.notify(source, {
        title = title,
        description = description
    })
end

local function WipeVehicles()
    for _, data in ipairs(Config.Countdown) do
        NotifyPlayer(-1, "Carwipe", ("Er is een handmatige carwipe over %d seconden"):format(data[1]))
        Wait(data[2])
    end

    NotifyPlayer(-1, "Carwipe", "Carwipe is uitgevoerd!")
    ExecuteCommand("fg clearveh")
    isActive = false
end

lib.addCommand('carwipe', {
    help = 'Wipe all vehicles',
    params = {},
    restricted = false
}, function(source, args, raw)
    if source == 0 then
        return WipeVehicles()
    end

    local xPlayer = ESX.GetPlayerFromId(source)

    if not xPlayer then
        return
    end

    if not Config.Allowed[xPlayer.identifier] then
        return NotifyPlayer(source, "Fout!", "Je hebt hier niet de juiste permissies voor!")
    end
    
    if isActive then
        return NotifyPlayer(source, "Fout!", "Er is al een carwipe bezig!")
    end

    isActive = true
    WipeVehicles()
end)