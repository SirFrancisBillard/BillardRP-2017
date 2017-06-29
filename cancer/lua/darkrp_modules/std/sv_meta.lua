
local META = FindMetaTable("Player")

function META:GiveSTD()
	timer.Create(self:SteamID() .. "_PlayerHasSTD", 1.5, 0, function()
		if not IsValid(self) then return end
		self:SetHealth(self:Health() - 5)
		self:EmitSound("STD.Moan")
		if self:Health() <= 0 then 
			self:Kill()
			self:CureSTD()
		end
	end)
end

function META:CureSTD()
	if timer.Exists(self:SteamID() .. "_PlayerHasSTD") then
		timer.Remove(self:SteamID() .. "_PlayerHasSTD")
	end
end
