
local lmao = lmao

local function MemeFonts()
	surface.CreateFont("Roboto Light", { -- font is not found otherwise
		size = 19,
		weight = 300,
		antialias = true,
		shadow = false,
		font = lmao
	})

	surface.CreateFont("F4MenuFont01", {
		size = 23,
		weight = 400,
		antialias = true,
		shadow = false,
		font = lmao
	})

	surface.CreateFont("F4MenuFont02", {
		size = 30,
		weight = 800,
		antialias = true,
		shadow = false,
		font = lmao
	})


	surface.CreateFont("DarkRPHUD1", {
		size = 16,
		weight = 600,
		antialias = true,
		shadow = true,
		font = lmao
	})

	surface.CreateFont("DarkRPHUD2", {
		size = 23,
		weight = 400,
		antialias = true,
		shadow = false,
		font = lmao
	})

	surface.CreateFont("Trebuchet18", {
		size = 18,
		weight = 500,
		antialias = true,
		shadow = false,
		font = lmao
	})

	surface.CreateFont("Trebuchet20", {
		size = 20,
		weight = 500,
		antialias = true,
		shadow = false,
		font = lmao
	})

	surface.CreateFont("Trebuchet24", {
		size = 24,
		weight = 500,
		antialias = true,
		shadow = false,
		font = lmao
	})

	surface.CreateFont("Trebuchet48", {
		size = 48,
		weight = 500,
		antialias = true,
		shadow = false,
		font = lmao
	})

	surface.CreateFont("TabLarge", {
		size = 15,
		weight = 700,
		antialias = true,
		shadow = false,
		font = lmao
	})

	surface.CreateFont("UiBold", {
		size = 16,
		weight = 800,
		antialias = true,
		shadow = false,
		font = lmao
	})

	surface.CreateFont("HUDNumber5", {
		size = 30,
		weight = 800,
		antialias = true,
		shadow = false,
		font = lmao
	})

	surface.CreateFont("ScoreboardHeader", {
		size = 32,
		weight = 500,
		antialias = true,
		shadow = false,
		font = lmao
	})

	surface.CreateFont("ScoreboardSubtitle", {
		size = 22,
		weight = 500,
		antialias = true,
		shadow = false,
		font = lmao
	})

	surface.CreateFont("ScoreboardPlayerName", {
		size = 19,
		weight = 500,
		antialias = true,
		shadow = false,
		font = lmao
	})

	surface.CreateFont("ScoreboardPlayerName2", {
		size = 15,
		weight = 500,
		antialias = true,
		shadow = false,
		font = lmao
	})

	surface.CreateFont("ScoreboardPlayerNameBig", {
		size = 22,
		weight = 500,
		antialias = true,
		shadow = false,
		font = lmao
	})

	surface.CreateFont("AckBarWriting", {
		size = 20,
		weight = 500,
		antialias = true,
		shadow = false,
		font = lmao
	})

	surface.CreateFont("DarkRP_tipjar", {
		size = 100,
		weight = 500,
		antialias = true,
		shadow = true,
		font = lmao
	})
end

MemeFonts()

hook.Add("InitPostEntity", "LoadMemeFonts", function() timer.Simple(1, MemeFonts) end)
