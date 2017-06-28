AddCSLuaFile()

ENT.Type = "anim"
ENT.Base = "base_anim"

ENT.PrintName = "Poop"
ENT.Spawnable = true
ENT.Model = "models/Gibs/HGIBS_spine.mdl"

if SERVER then
	function ENT:Initialize()
		self:SetModel(self.Model)
		self:SetColor(Color(100, 500, 0))
		self:SetMaterial("models/props_pipes/pipeset_metal") 
		self:PhysicsInit(SOLID_VPHYSICS)
		self:SetMoveType(MOVETYPE_VPHYSICS)
		self:SetSolid(SOLID_VPHYSICS)
		self:SetCollisionGroup(COLLISION_GROUP_INTERACTIVE_DEBRIS)
		self:PhysWake()
	end

	function ENT:Use(activator, caller)
		if math.random(1, 4) == 1 then
			caller:ChatPrint("You got an STD lol")
			caller:GiveSTD()
			return
		end

		if caller:Health() <= 10 then 
			caller:Kill()
		else
			caller:SetHealth(caller:Health() - 10)
		end

		self:Remove()
	end
else -- CLIENT
	function ENT:Draw()
		self:DrawModel() 
	end
end
