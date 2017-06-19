
local coffre = {
  {x=0.0, y=0.0, z=0.0},
  {x=0.0, y=0.0, z=0.0},
  {x=0.0, y=0.0, z=0.0},
  {x=0.0, y=0.0, z=0.0},
  {x=0.0, y=0.0, z=0.0},
  {x=0.0, y=0.0, z=0.0},
  {x=0.0, y=0.0, z=0.0},
  {x=0.0, y=0.0, z=0.0},

}



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
      for i = 1, #coffre do
        Citizen.Wait(0)
            DrawMarker(1,coffre[i].x,coffre[i].y,coffre[i].z,0,0,0,0,0,0,1.0,1.0,1.0,255,0,0,0,0,0,0,0)
            if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), coffre[i].x,coffre[i].y,coffre[i].z,true ) < 2 then
              ShowInfo('~b~Appuyer sur ~g~E~b~ pour ouvrir votre coffre fort', 0)
              if IsControlJustPressed(1,38) then
                  OpenfbiMenu()
 
              end
            end
      end
    end
end)

--Createur Nelyo  :   https://github.com/ElNelyo/cop-coffre

--Modifications et Ameliorations  : Irtas Momaki / Walter White