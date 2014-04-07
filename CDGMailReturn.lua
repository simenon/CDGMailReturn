
local function CDGMailReturnUpdate()
	for mailItem = 1, GetNumMailItems(), 1 do
		local senderDisplayName, senderCharacterName, subject, icon, unread, fromSystem, fromCustomerService, returned, numAttachments, attachedMoney, codAmount, expiresInDays, secsSinceReceived = GetMailItemInfo(GetNextMailId(mailItem))
		d("Item "..mailItem.." from "..senderDisplayName.." subject "..subject)
	end
end

function CDGMailReturnUpdate_OnInitialized()
	EVENT_MANAGER:RegisterForEvent("CDGMailReturn",EVENT_MAIL_INBOX_UPDATE, CDGMailReturnUpdate)
end
