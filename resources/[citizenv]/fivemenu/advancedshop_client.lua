

function DrawNotif(text)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(text)
	DrawNotification(false, false)
end

function PlayScenario1(param1) 
	Citizen.CreateThread(function()
		TaskStartScenarioInPlace(GetPlayerPed(-1), param1, 0, 1)
		Citizen.Wait(20000)
		ClearPedTasksImmediately(GetPlayerPed(-1))
	end)
end

function PlayScenario2(param1) 
	Citizen.CreateThread(function()
		TaskStartScenarioInPlace(GetPlayerPed(-1), param1, 0, 1)
		Citizen.Wait(20000)
		ClearPedTasksImmediately(GetPlayerPed(-1))
	end)
end

function PlayScenario3(param1) 
	Citizen.CreateThread(function()
		TaskStartScenarioInPlace(GetPlayerPed(-1), param1, 0, 1)
		Citizen.Wait(20000)
		ClearPedTasksImmediately(GetPlayerPed(-1))
	end)
end

function Toxicated()
          TaskStartScenarioInPlace(GetPlayerPed(-1), "WORLD_HUMAN_DRUG_DEALER", 0, 1)
          Citizen.Wait(2000)
          DoScreenFadeOut(500)
          Citizen.Wait(500)
          ClearPedTasksImmediately(GetPlayerPed(-1))
          SetTimecycleModifier("spectator5")
          SetPedMotionBlur(GetPlayerPed(-1), true)
          SetPedMovementClipset(GetPlayerPed(-1), "MOVE_M@DRUNK@SLIGHTLYDRUNK", true)
          SetPedIsDrunk(GetPlayerPed(-1), true)
          DoScreenFadeIn(500)
end

function reality()
          Citizen.Wait(300000)
          DoScreenFadeOut(1000)
          Citizen.Wait(1000)
          DoScreenFadeIn(1000)
          ClearTimecycleModifier()
          ResetScenarioTypesEnabled()
          ResetPedMovementClipset(GetPlayerPed(-1), 0)
          SetPedIsDrunk(GetPlayerPed(-1), false)
          SetPedMotionBlur(GetPlayerPed(-1), false)
          DrawNotif("~g~Retour à la réalité~s~")
end

-----DEBUT CIGARETTES-----

RegisterNetEvent("cigarettes:fumer")
AddEventHandler("cigarettes:fumer", function()
local player = GetPlayerPed(-1)
local currentHealth = GetEntityHealth(player)
	   PlayScenario1("WORLD_HUMAN_SMOKING")                  
	   Wait(20000)
	   SetEntityHealth(player, currentHealth - 5)
       DrawNotif("Tu as fumé une ~g~cigarette")        
end)

-----FIN CIGARETTES-----

-----DEBUT KIT DE REPARATION-----

RegisterNetEvent("repair:repairkit")
AddEventHandler("repair:repairkit", function()
local pos = GetEntityCoords( GetPlayerPed(-1), 1 )
local car = GetClosestVehicle( pos.x, pos.y, pos.z, 3.000, 0, 70)
    
    if DoesEntityExist(car) then
        local myPed = GetPlayerPed(-1)
        local scenario = 'WORLD_HUMAN_VEHICLE_MECHANIC'
        local h = GetEntityHeading(myPed)
        TaskStartScenarioAtPosition(myPed, scenario, pos.x, pos.y, pos.z, h-180, 0, 0, 1)                       
       TriggerEvent('InteractSound_CL:PlayOnOne', 'repair', 1.0)       
       Wait(20000)   
        ClearPedTasks(myPed)       
       SetVehicleFixed(car)                                             
       SetVehicleEngineHealth(car, 1000.0)                              
       SetVehicleBodyHealth( car, 1000.0)                              
       SetVehicleEngineOn( car, true, false, true)
       DrawNotif("Le véhicule est ~g~réparé")                           
    else
       DrawNotif("~r~Aucun véhicule à proximité")                      
       TriggerEvent("player:receiveItem", 28, 1)         
    end
end)


-----FIN KIT DE REPARATION-----

-----DEBUT KIT DE SOINS-----

RegisterNetEvent("medecin:soins")
AddEventHandler("medecin:soins", function()
local player = GetPlayerPed(-1)
	   PlayScenario3("WORLD_HUMAN_YOGA")                       
	   Wait(20000)  
	   SetEntityHealth(player, 200)
       DrawNotif("Tu t'es ~g~soigné")   
end)

-----FIN KIT DE SOINS-----

-----DEBUT FUMER UN JOINT-----

RegisterNetEvent("petard:fumer")
AddEventHandler("petard:fumer", function()
local player = GetPlayerPed(-1)
local currentHealth = GetEntityHealth(player)
	   PlayScenario1("WORLD_HUMAN_SMOKING") 
	   Wait(20000) 
	   SetEntityHealth(player, currentHealth - 5)
       DrawNotif("Tu as fumé un ~g~pétard de weed")
       Citizen.Wait(60000)
       DrawNotif("~r~Attention tu commence a etre défoncé~s~")
       Citizen.Wait(30000)
       DrawNotif("~r~Voila tu es défoncé~s~")
       Citizen.Wait(1000)
	   Toxicated()
	   Citizen.Wait(100)
	   reality()    
end)

-----FIN FUMER UN JOINT-----
