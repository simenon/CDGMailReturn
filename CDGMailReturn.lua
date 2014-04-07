
local function CDGMailReturnUpdate()
  local numMailItems = GetNumMailItems()
	local nextMailId = nil

	for mailItem = 1, numMailItems, 1 do
		nextMailId = GetNextMailId( nextMailId )
		local senderDisplayName, senderCharacterName, subject, icon, unread, fromSystem, fromCustomerService, returned, numAttachments, attachedMoney, codAmount, expiresInDays, secsSinceReceived = GetMailItemInfo( nextMailId )
		d( string.format( "Item %d from %s with subject %s received ", nextMailId, senderDisplayName, subject ) ) 
	end
end

function CDGMailReturnUpdate_OnInitialized()
	EVENT_MANAGER:RegisterForEvent("CDGMailReturn",EVENT_MAIL_INBOX_UPDATE, CDGMailReturnUpdate)
end
