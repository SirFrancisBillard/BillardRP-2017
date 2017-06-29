
function LynchingEnabled()
	return player.GetCount() > 2

function GetVotesNeededToLynch()
	return math.ceil(player.GetCount() * 0.6)
end
