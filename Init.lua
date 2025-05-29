InstanceResetHelper = LibStub("AceAddon-3.0"):NewAddon("InstanceResetHelper", "AceConsole-3.0", "AceEvent-3.0")

function InstanceResetHelper:OnInitialize()

	self.Variables = {
		PlayerWasInInstance = false
	}

end