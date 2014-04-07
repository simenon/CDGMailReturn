
local function CDGMailReturnUpdate()
	for MailItem = 1, GetNumMailItems(), 1 do
		local senderDisplayName, senderCharacterName, subject, icon, unread, fromSystem, fromCustomerService, returned, numAttachments, attachedMoney, codAmount, expiresInDays, secsSinceReceived = GetMailItemInfo(MailItem)
		d(string.format("Item %d from %s Sender %s Subject %s", MailItem, senderDisplayName, senderCharacterName, subject ))
	end
end

function CDGMailReturnUpdate_OnInitialized()
	EVENT_MANAGER:RegisterForEvent("CDGMailReturn",EVENT_MAIL_INBOX_UPDATE, CDGMailReturnUpdate)
end
