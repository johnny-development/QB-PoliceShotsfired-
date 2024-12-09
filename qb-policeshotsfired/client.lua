-- Listen for weapon firing
CreateThread(function()
    while true do
        Wait(500)
        local ped = PlayerPedId()
        if IsPedShooting(ped) then
            local coords = GetEntityCoords(ped)
            TriggerServerEvent('qb-policeshotsfired:gunfire', coords)
        end
    end
end)
