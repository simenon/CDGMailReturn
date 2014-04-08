local function CDGMailReturnUpdate()
  local numMailItems = GetNumMailItems()
	local nextMailId = nil

	for mailItem = 1, numMailItems, 1 do
		nextMailId = GetNextMailId( nextMailId )
		local senderDisplayName, _, subject, _, unread, fromSystem, fromCustomerService, _, numAttachments, _, _, _, _ = GetMailItemInfo( nextMailId )
		if numAttachments > 0 and not fromSystem and not fromCustomerService and unread then
			if string.upper( string.sub( subject,1,6 ) ) == "RETURN" or 
			   string.upper( string.sub( subject,1,6 ) ) == "BOUNCE" then
				ReturnMail( nextMailId )
				d( string.format( "Item %d from %s with subject %s returned ", nextMailId, senderDisplayName, subject ) )
			end
		end
	end
end

function CDGMailReturnUpdate_OnInitialized()
	EVENT_MANAGER:RegisterForEvent("CDGMailReturn",EVENT_MAIL_INBOX_UPDATE, CDGMailReturnUpdate)
end
