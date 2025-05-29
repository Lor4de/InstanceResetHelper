InstanceResetHelper = LibStub("AceAddon-3.0"):GetAddon("InstanceResetHelper")

local function ResetAnnounce()
	InstanceResetHelper:ResetAnnounce()
end

function InstanceResetHelper:OnEnable()

	self:RegisterChatCommand("resetinstances", "ResetInstances")
	self:RegisterChatCommand("ri", "ResetInstances")

	self:RegisterEvent("CHAT_MSG_SYSTEM")
	self:RegisterEvent("PLAYER_ENTERING_WORLD")
	self:RegisterEvent("PLAYER_LEAVING_WORLD")

	hooksecurefunc("ResetInstances", ResetAnnounce)
end

function InstanceResetHelper:OnDisable()
	self:UnregisterEvent("CHAT_MSG_SYSTEM")
	self:UnregisterEvent("PLAYER_ENTERING_WORLD")
	self:UnregisterEvent("PLAYER_LEAVING_WORLD")
end

function InstanceResetHelper:PLAYER_ENTERING_WORLD()
	if (IsInInstance() == false and self.Variables.PlayerWasInInstance == true) then
		self:Print("Use /resetinstances to reset the currently locked instances")
		self.Variables.PlayerWasInInstance = false
	elseif (IsInInstance() == true and self.Variables.PlayerWasInInstance == false) then
		self.Variables.PlayerWasInInstance = true
	end
end

function InstanceResetHelper:PLAYER_LEAVING_WORLD()
	if (IsInInstance() == true) then
		self.Variables.PlayerWasInInstance = true
	end
end

function InstanceResetHelper:CHAT_MSG_SYSTEM(event, message)
	if (string.match(message, string.gsub(INSTANCE_RESET_SUCCESS, "%%s", ".+"))) then
		self:SendMessage(message);
	elseif (string.match(message, string.gsub(INSTANCE_RESET_FAILED, "%%s", ".+"))) then
		local instance = string.match(message, string.gsub(INSTANCE_RESET_FAILED, "%%s", "(.+)"));
		self:SendMessage(instance .. " has been reset, but there are still players inside the old instance.");
	elseif (string.match(message, string.gsub(INSTANCE_RESET_FAILED_ZONING, "%%s", ".+"))) then
		local instance = string.match(message, string.gsub(INSTANCE_RESET_FAILED, "%%s", "(.+)"));
		self:SendMessage(message);
	elseif (string.match(message, string.gsub(INSTANCE_RESET_FAILED_OFFLINE, "%%s", ".+"))) then
		local instance = string.match(message, string.gsub(INSTANCE_RESET_FAILED, "%%s", "(.+)"));
		self:SendMessage(message);
	end
end