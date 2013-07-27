local GM = GM
local player_manager = player_manager
local BaseClass = GM:getBaseClass()

--[[---------------------------------------------------------
   Name: gamemode:PlayerSpawn( )
   Desc: Called when a player spawns
-----------------------------------------------------------]]
function GM:PlayerSpawn( ply )

	BaseClass.PlayerSpawn( self, ply )

end

local function changeRaceClass(ply, race)
	player_manager.SetPlayerClass( ply, race )
	ply:KillSilent()
end

--[[---------------------------------------------------------
   Called once on the player's first spawn
-----------------------------------------------------------]]
function GM:PlayerInitialSpawn( ply )

	local rand = math.random(0,3)

	if rand >= 2 then
		changeRaceClass(ply, "player_terran")
	elseif rand >= 1 then
		changeRaceClass(ply, "player_radijn")
	elseif rand >= 0 then
		changeRaceClass(ply, "player_pendrouge")
	end
	BaseClass.PlayerInitialSpawn( self, ply )

end

--[[---------------------------------------------------------
   Called on the player's every spawn
-----------------------------------------------------------]]
function GM:PlayerSpawn( ply )	
	local spawners = ents.FindByClass("infinity_player_start")
	for k,v in pairs(spawners) do
		if(ply:getRace() == v.Race)then
			ply:SetPos(v:GetPos())
		end
	end
	--Base GM Stuff:
	
	player_manager.OnPlayerSpawn( ply )
	player_manager.RunClass( ply, "Spawn" )
	
	ply:UnSpectate()
	--Call the player loadout hook
	hook.Call( "PlayerLoadout", GAMEMODE, ply )
	
	--Set player model with the hook
	hook.Call( "PlayerSetModel", GAMEMODE, ply )
end