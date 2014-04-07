local function CDGMailReturnUpdate()
  local numMailItems = GetNumMailItems()
	local nextMailId = nil

	for mailItem = 1, numMailItems, 1 do
		nextMailId = GetNextMailId( nextMailId )
		local senderDisplayName, senderCharacterName, subject, icon, unread, fromSystem, fromCustomerService, returned, numAttachments, attachedMoney, codAmount, expiresInDays, secsSinceReceived = GetMailItemInfo( nextMailId )
		if numAttachments > 0 and not fromSystem and not fromCustomerService and unread then
			if string.upper( string.sub( subject,1,6 ) ) == ("RETURN" or "BOUNCE") then
				ReturnMail( nextMailId )
				d( string.format( "Item %d from %s with subject %s returned ", nextMailId, senderDisplayName, subject ) )
			end
		end
	end
end

function CDGMailReturnUpdate_OnInitialized()
	EVENT_MANAGER:RegisterForEvent("CDGMailReturn",EVENT_MAIL_INBOX_UPDATE, CDGMailReturnUpdate)
end
