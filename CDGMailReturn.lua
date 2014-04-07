function CDGMailReturnUpdate_OnInitialized()
	EVEMT_MANAGER:RegisterForEvent("CDGMailReturn",EVENT_MAIL_INBOX_UPDATE, CDGMailReturnUpdate)
end

local function CDGMailReturnUpdate()
	for MailItem = 1, GetNumMailItems() do
		senderDisplayName, senderCharacterName, subject, icon, unread, fromSystem, fromCustomerService, returned, numAttachments, attachedMoney, codAmount, expiresInDays, secsSinceReceived = GetMailItemInfo(MailItem)
		CDGMailReturnCounter:SetText(string.format("Item %d Sender %s Subject %s", MailItem, senderCharacterName, subject ))
	end
end
