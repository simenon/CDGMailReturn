
local function CDGMailReturnUpdate()
  local numMailItems = GetNumMailItems()
	for mailItem = 1, numMailItems do
		mailId = GetNextMailId( mailItem )
		local senderDisplayName, senderCharacterName, subject, icon, unread, fromSystem, fromCustomerService, returned, numAttachments, attachedMoney, codAmount, expiresInDays, secsSinceReceived = GetMailItemInfo(mailId)
		d("Item "..mailId.." from "..senderDisplayName.." subject "..subject)
	end
end

function CDGMailReturnUpdate_OnInitialized()
	EVENT_MANAGER:RegisterForEvent("CDGMailReturn",EVENT_MAIL_INBOX_UPDATE, CDGMailReturnUpdate)
end
