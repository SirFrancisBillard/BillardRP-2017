
util.AddNetworkString("TTS.Parse")

function TTS(ply)
	net.Start("TTS.Parse")
	net.WriteString(text)
	net.WriteEntity(ply)
	net.Broadcast()
end

DarkRP.defineChatCommand("roll", TTS)
