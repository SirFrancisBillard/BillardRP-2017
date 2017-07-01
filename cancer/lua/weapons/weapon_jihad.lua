AddCSLuaFile()

if SERVER then
	resource.AddFile("sound/jihad/jihad_1.wav")
	resource.AddFile("sound/jihad/jihad_2.wav")

	resource.AddFile("sound/music/islam.wav")
end

sound.Add({
	name = "Jihad.Scream",
	channel = CHAN_AUTO,
	volume = 1.0,
	level = 150,
	pitch = {95, 110},
	sound = {"jihad/jihad_1.wav", "jihad/jihad_2.wav"}
})

sound.Add({
	name = "Jihad.Explode",
	channel = CHAN_AUTO,
	volume = 1.0,
	level = 150,
	pitch = {100},
	sound = {"ambient/explosions/explode_1.wav", "ambient/explosions/explode_3.wav", "ambient/explosions/explode_4.wav"}
})

sound.Add({
	name = "Jihad.Islam",
	channel = CHAN_AUTO,
	volume = 1.0,
	level = 150,
	pitch = {100},
	sound = {"music/islam.wav"}
})

SWEP.PrintName = "Jihad Bomb"
SWEP.Slot = 4
SWEP.SlotPos = 1
SWEP.DrawAmmo = false
SWEP.DrawCrosshair = false

SWEP.Instructions = "Primary fire to explode almost instantly."
SWEP.Purpose = "Sacrifice yourself for Allah."

SWEP.UseHands = true
SWEP.ViewModel = "models/weapons/cstrike/c_c4.mdl"
SWEP.WorldModel = "models/weapons/w_c4.mdl"

SWEP.ViewModelFOV = 54
SWEP.ViewModelFlip = false

SWEP.Spawnable = true

SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = -1
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = ""

SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = ""

function SWEP:Initialize()
	self:SetHoldType("slam")

	util.PrecacheModel("models/Humans/Charple01.mdl")
	util.PrecacheModel("models/Humans/Charple02.mdl")
	util.PrecacheModel("models/Humans/Charple03.mdl")
	util.PrecacheModel("models/Humans/Charple04.mdl")
end

function SWEP:PrimaryAttack()
	self:SetNextPrimaryFire(CurTime() + 2)

	-- self.Owner:AnimRestartGesture(GESTURE_SLOT_ATTACK_AND_RELOAD, ACT_GMOD_GESTURE_TAUNT_ZOMBIE, true)

	if SERVER then
		-- todo: consider moving these first four functions outside of SERVER to minimize networking?
		-- update: moved the gesture to shared but kept the sound to sync which sound it plays

		self.Owner:AnimRestartGesture(GESTURE_SLOT_ATTACK_AND_RELOAD, ACT_GMOD_GESTURE_TAUNT_ZOMBIE, true)
		BroadcastLua([[Entity(]] .. self.Owner:EntIndex() .. [[):AnimRestartGesture(GESTURE_SLOT_ATTACK_AND_RELOAD, ACT_GMOD_GESTURE_TAUNT_ZOMBIE, true)]])

		self:SendWeaponAnim(ACT_VM_PRIMARYATTACK)
		self.Owner:EmitSound("Jihad.Scream")

		SafeRemoveEntityDelayed(self, 0.99)
		local ply = self.Owner
		timer.Simple(1, function()
			if not IsValid(ply) or not ply:Alive() then return end
			local pos = ply:GetPos()

			ParticleEffect("explosion_huge", pos, vector_up:Angle())
			ply:EmitSound(Sound("Jihad.Explode"))

			util.Decal("Rollermine.Crater", pos, pos - Vector(0, 0, 500), ply)
			util.Decal("Scorch", pos, pos - Vector(0, 0, 500), ply)

			ply:SetModel("models/Humans/Charple0" .. math.random(1, 4) .. ".mdl")
			ply:SetColor(color_white)

			util.BlastDamage(ply, ply, pos, 1000, 230)

			timer.Simple(0.5, function()
				if not pos then return end

				sound.Play(Sound("Jihad.Islam"), pos)
			end)
		end)
	end
end

function SWEP:SecondaryAttack() end
