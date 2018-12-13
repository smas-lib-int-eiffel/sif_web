note
	description: "Summary description for {SIF_INTERACTION_ELEMENT_IDENTIFIERS_WEB}."
	author: "Ricardo Barrera Ramirez"
	date: "$Date$"
	revision: "$Revision$"

class
	SIF_INTERACTION_ELEMENT_IDENTIFIERS_WEB

	inherit

	SIF_INTERACTION_ELEMENT_IDENTIFIERS
		rename
			is_equal as sif_interaction_element_identifiers_is_equal,
			copy as sif_interaction_element_identifiers_copy
		end

feature -- Enumeration
	Iei_web_lowest: INTEGER_64 = 10000
	Iei_web_highest: INTEGER_64 = 19999

	-- Initial Request
	Iei_web_page_caption: INTEGER_64
		once
			Result := Iei_web_lowest + 1
		end

	Iei_web_media_caption: INTEGER_64
		once
			Result := Iei_web_lowest + 2
		end

	Iei_web_theme_caption: INTEGER_64
		once
			Result := Iei_web_lowest + 3
		end

	Iei_web_page: INTEGER_64
		once
			Result := Iei_web_lowest + 100
		end

	Iei_web_redirect: INTEGER_64
		once
			Result := Iei_web_lowest + 101
		end

	Iei_web_media: INTEGER_64
		once
			Result := Iei_web_lowest + 102
		end

	Iei_media_name: INTEGER_64
		once
			Result := Iei_web_lowest + 103
		end

	Iei_web_theme: INTEGER_64
		once
			Result := Iei_web_lowest + 104
		end

	Iei_theme_name: INTEGER_64
		once
			Result := Iei_web_lowest + 105
		end

end

