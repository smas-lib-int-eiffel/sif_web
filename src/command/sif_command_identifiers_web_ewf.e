note
	description: "Summary description for {SIF_COMMAND_IDENTIFIERS_WEB_EWF}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	SIF_COMMAND_IDENTIFIERS_WEB_EWF
	inherit
		SIF_COMMAND_IDENTIFIERS


feature {NONE} -- Enumeration for CJIB simulator commands

	Ci_web_media: INTEGER_64
	once
		Result := Ci_web_ewf_lowest + 1
	end

	Ci_web_theme: INTEGER_64
	once
		Result := Ci_web_ewf_lowest + 2
	end

end
