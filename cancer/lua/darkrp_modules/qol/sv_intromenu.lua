
hook.Add("PlayerInitialSpawn", "IntroMenu.OpenOnClient", function(ply)
	ply:ConCommand("rp_intromenu")
end)
