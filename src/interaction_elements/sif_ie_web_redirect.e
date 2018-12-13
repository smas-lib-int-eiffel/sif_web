note
	description: "Summary description for {SIF_IE_WEB_REDIRECT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	SIF_IE_WEB_REDIRECT

	inherit
		SIF_INTERACTION_ELEMENT
			redefine
				make
			end

		SIF_SHARED_COMMAND_MANAGER
			undefine
				is_equal
			end

create
	make

feature -- Creation

	make (an_interaction_element_identifier: INTEGER_64; a_sorted_set_of_interaction_elements : SIF_INTERACTION_ELEMENT_SORTED_SET; a_type: like {SIF_ENUM_INTERACTION_ELEMENT_TYPE}.type; a_descriptor: like descriptor )
		do
			Precursor (an_interaction_element_identifier, a_sorted_set_of_interaction_elements, a_type, a_descriptor)
		end

feature -- Access


feature -- Element change

	put_command_id (a_command_id: like {SIF_COMMAND}.identifier)
			-- The command id which contains the uri to which needs to be redirected
		require
			command_exists: attached command_manager.command(a_command_id)
		do
			internal_command_id := a_command_id
		end

feature -- Event types


feature {NONE} -- Implementation

	internal_command_id: like {SIF_COMMAND}.identifier

;note
	copyright: "Copyright (c) 2014-2017, SMA Services"
	license:   "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			SMA Services
			Website: http://www.sma-services.com
		]"

end
