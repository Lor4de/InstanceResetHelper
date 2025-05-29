InstanceResetHelper = LibStub("AceAddon-3.0"):GetAddon("InstanceResetHelper")

function InstanceResetHelper:ResetInstances()
    ResetInstances()
end

function InstanceResetHelper:SendMessage(message)
	if UnitIsGroupLeader("player") then
		if IsInRaid() then
  			SendChatMessage(message, "RAID");
  		elseif IsInGroup() then
  			SendChatMessage(message, "PARTY");
  		end
    else
        self:Print(message)
  	end
end

function InstanceResetHelper:ResetAnnounce()
  	self:SendMessage("<Resetting all instances>");
end