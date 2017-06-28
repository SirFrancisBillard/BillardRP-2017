AddCSLuaFile()

ENT.Type = "anim"
ENT.Base = "base_anim"

ENT.PrintName = "Bleach"
ENT.Spawnable = true
ENT.Model = "models/props_junk/garbage_plasticbottle001a.mdl"

if SERVER then
	function ENT:Initialize()
		self:SetModel(self.Model)
		self:PhysicsInit(SOLID_VPHYSICS)
		self:SetMoveType(MOVETYPE_VPHYSICS)
		self:SetSolid(SOLID_VPHYSICS)
		self:SetCollisionGroup(COLLISION_GROUP_INTERACTIVE_DEBRIS)
		self:PhysWake()
	end

	function ENT:Use(activator, caller)
		if IsValid(caller) and caller:IsPlayer() then
			caller:ChatPrint("lmoa kid actually killed himself")
			caller:Kill()
			SafeRemoveEntity(self)
		end
	end
else -- CLIENT
	function ENT:Draw()
		self:DrawModel() 
	end
end
