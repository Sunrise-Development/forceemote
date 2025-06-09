RegisterNetEvent("force_emote:play", function(scenario)
    local ped = PlayerPedId()

    if IsPedInAnyVehicle(ped, false) then
        ClearPedTasks(ped) -- Sicher entfernen
    else
        ClearPedTasksImmediately(ped)
    end

    TaskStartScenarioInPlace(ped, scenario, 0, true)
end)
