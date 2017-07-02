AddCSLuaFile()

SWEP.PrintName = "Hands"
SWEP.Slot = 1
SWEP.SlotPos = 1
SWEP.DrawAmmo = false
SWEP.DrawCrosshair = false

SWEP.Instructions = ""

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
