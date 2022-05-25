local abrochado = false


CreateThread(function()
    while true do
        local _s = 1000
        local veh = GetVehiclePedIsIn(PlayerPedId())
        local ped = PlayerPedId()
        if IsPedInAnyVehicle(PlayerPedId()) then
            _s = 100
            SendNUIMessage({
                action = "InVeh";
                fuel   = GetVehicleFuelLevel(veh);
                kmh    = ((GetEntitySpeed(veh)) * 3.6);

            })

        elseif not IsPedInAnyVehicle(PlayerPedId()) then
            SendNUIMessage({
                action = "outVeh";
            })
        end
        Wait(_s)
    end
end)

SeatBelt = function()
    while true do
        if cinto then 
            DisableControlAction(0, 75, true)
            DisableControlAction(27, 75, true)
        else      
            Wait(1500)
        end
        Wait(0)
    end
end

RegisterCommand('cinturon', function()
    if IsPedInAnyVehicle(PlayerPedId()) then
        if cinto then
            SendNUIMessage({ action = "cintofalse" })
            cinto = false
            SeatBelt(PlayerPedId())
        else
            SendNUIMessage({ action = "cintotrue" })
            cinto = true
            SeatBelt(PlayerPedId())
        end
    end
end)

RegisterKeyMapping('cinturon', 'Colocarse el Cinturon', 'keyboard', "b")