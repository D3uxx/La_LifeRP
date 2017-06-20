local coffre = {
    {name="CoffreFort", x=0.0, y=0.0, z=0.0},
    {name="CoffreFort", x=0.0, y=0.0, z=0.0},
    {name="CoffreFort", x=0.0, y=0.0, z=0.0},
    {name="CoffreFort", x=0.0, y=0.0, z=0.0},
    {name="CoffreFort", x=0.0, y=0.0, z=0.0},
    {name="CoffreFort", x=0.0, y=0.0, z=0.0},
    {name="CoffreFort", x=0.0, y=0.0, z=0.0},
    {name="CoffreFort", x=0.0, y=0.0, z=0.0},
    {name="CoffreFort", x=0.0, y=0.0, z=0.0},
    {name="CoffreFort", x=0.0, y=0.0, z=0.0},
	{name="CoffreFort", x=0.0, y=0.0, z=0.0}
}
coffrefortselected = { {x=nil, y=nil, z=nil}, }


function drawTxt(text,font,centre,x,y,scale,r,g,b,a)
  SetTextFont(font)
  SetTextProportional(0)
  SetTextScale(scale, scale)
  SetTextColour(r, g, b, a)
  SetTextDropShadow(0, 0, 0, 0,255)
  SetTextEdge(1, 0, 0, 0, 255)
  SetTextDropShadow()
  SetTextOutline()
  SetTextCentre(centre)
  SetTextEntry("STRING")
  AddTextComponentString(text)
  DrawText(x , y)
end



function ShowInfo(text, state)
  SetTextComponentFormat("STRING")
  AddTextComponentString(text)DisplayHelpTextFromStringLabel(0, state, 0, -1)
end




Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		for _, coffrefort in pairs(coffre) do
			DrawMarker(1, coffrefort.x, coffrefort.y, coffrefort.z, 0, 0, 0, 0, 0, 0, 0.0, 0.0, 0.0, 0, 0, 0, 0, 0, 0, 0, 0)
			if GetDistanceBetweenCoords(coffrefort.x, coffrefort.y, coffrefort.z, GetEntityCoords(LocalPed())) < 2 and IsPedInAnyVehicle(LocalPed(), true) == false then
				 ShowInfo("Appuyer sur ~g~F6~s~ pour ouvrir le coffre fort",0,1,0.5,0.8,0.6,255,255,255,255)
				if IsControlJustPressed(1, 167) then
					OpenfbiMenu()
				end
			end
		end
	end
end)

--Createur Nelyo  :   https://github.com/ElNelyo/cop-coffre

--Modifications et Ameliorations  : Irtas Momaki / Walter White
