
hook.Add("PlayerInitialSpawn", "ResetLynchTarget", function(ply)
	ply.LynchTarget = false
end)
