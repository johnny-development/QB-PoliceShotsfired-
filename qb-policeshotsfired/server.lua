-- Define a function to notify police players
local function notifyPolice(message)
    local Players = QBCore.Functions.GetPlayers()
    for _, playerId in pairs(Players) do
        local Player = QBCore.Functions.GetPlayer(playerId)
        if Player and Player.PlayerData.job.name == "police" then
            TriggerClientEvent('QBCore:Notify', playerId, message, 'success')
        end
    end
end

-- Register a server event to handle gunfire
RegisterServerEvent('qb-policeshotsfired:gunfire')
AddEventHandler('qb-policeshotsfired:gunfire', function(location)
    local coords = vector3(location.x, location.y, location.z)
    local streetName = GetStreetNameFromHashKey(GetStreetNameAtCoord(location.x, location.y, location.z))
    local message = "Shots fired reported at " .. streetName
    notifyPolice(message)
end)
