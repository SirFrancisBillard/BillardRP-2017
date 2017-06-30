
hook.Add("PlayerDeath", "RobloxDeathSound", function(ply)
	if IsValid(ply) then
		ply:EmitSound("memes/roblox.wav")
	end
end)
