
local function CDGMailReturnUpdate()
  local numMailItems = GetNumMailItems()
	for mailItem = 1, numMailItems do
		nextMailId = GetNextMailId( mailItem )
		local senderDisplayName, senderCharacterName, subject, icon, unread, fromSystem, fromCustomerService, returned, numAttachments, attachedMoney, codAmount, expiresInDays, secsSinceReceived = GetMailItemInfo(nextMailId)
		d(string.format("Item %d from %s with subject %s received ", nextMailId, senderDisplayName, subject))
	end
end

function CDGMailReturnUpdate_OnInitialized()
	EVENT_MANAGER:RegisterForEvent("CDGMailReturn",EVENT_MAIL_INBOX_UPDATE, CDGMailReturnUpdate)
end
