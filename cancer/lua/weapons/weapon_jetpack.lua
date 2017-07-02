AddCSLuaFile()

SWEP.PrintName = "Jetpack"
SWEP.Slot = 2
SWEP.SlotPos = 1
SWEP.DrawAmmo = false
SWEP.DrawCrosshair = false

SWEP.Instructions = "<color=green>[JUMP]</color> Fly upwards."

SWEP.UseHands = false
SWEP.ViewModel = ""
SWEP.WorldModel = ""

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

SWEP.IsJetpack = true

hook.Add("StartCommand", "Jetpack", function(ply, cmd)
	local wep = ply:GetActiveWeapon()
	if IsValid(wep) and wep.IsJetpack and cmd:KeyDown(IN_JUMP) then
		ply:SetVelocity(Vector(0, 0, 25))
	end
end)

function SWEP:Initialize()
	self:SetHoldType("normal")
end

function SWEP:CanPrimaryAttack()
	return true
end

function SWEP:PrimaryAttack() end

function SWEP:CanSecondaryAttack()
	return true
end

function SWEP:SecondaryAttack() end
