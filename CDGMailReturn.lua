local function CDGMailReturnUpdate()
  local numMailItems = GetNumMailItems()
	local nextMailId = nil

	for mailItem = 1, numMailItems, 1 do
		nextMailId = GetNextMailId( nextMailId )
		local senderDisplayName, senderCharacterName, subject, icon, unread, fromSystem, fromCustomerService, returned, numAttachments, attachedMoney, codAmount, expiresInDays, secsSinceReceived = GetMailItemInfo( nextMailId )
		if numAttachments > 0 then
			if string.upper( string.sub( subject,1,6 ) ) == ("RETURN" or "BOUNCE") then
--				d( string.format( "Item %d from %s with subject %s received ", nextMailId, senderDisplayName, subject ) )
				d( string.format( "DBG senderDisplayName [%s] senderCharacterName [%s] subject [%s] icon [%s] unread [%s] fromSystem [%s] fromCustomerService [%s] returned [%s] numAttachments [%d] attachedMoney [%d] codAmount [%d] expiresInDays [%d] secsSinceReceived [%d]",  senderDisplayName, senderCharacterName, subject, icon, unread, fromSystem, fromCustomerService, returned, numAttachments, attachedMoney, codAmount, expiresInDays, secsSinceReceived ) )
			end
		end
	end
end


function CDGMailReturnUpdate_OnInitialized()
	EVENT_MANAGER:RegisterForEvent("CDGMailReturn",EVENT_MAIL_INBOX_UPDATE, CDGMailReturnUpdate)
end
