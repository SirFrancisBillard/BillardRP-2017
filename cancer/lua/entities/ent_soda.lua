AddCSLuaFile()

ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Soda"

ENT.Spawnable = true
ENT.Model = "models/props_junk/PopCan01a.mdl"

function ENT:Initialize()
	self:SetModel(self.Model)
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	self:SetUseType(SIMPLE_USE)
	self:PhysWake()

	self.Health = 10
end

function ENT:OnTakeDamage(dmg)
	self.Health = self.Health - dmg:GetDamage()
	if self.Health <= 0 then
		self:Remove()
	end
end

function ENT:Use(ply)
	ply:EmitSound("soda/slurp.wav", 50, 100)
	ply:SetHealth(math.min(ply:Health() + 5, ply:GetMaxHealth()))

	self:Remove()

	timer.Simple(3, function()
		ply:EmitSound("soda/burp.wav", 50, 100)
	end)
end
