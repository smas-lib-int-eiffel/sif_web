note
	description: "Summary description for {SIF_IE_WEB_PAGE}."
	author: "Paul Gokke"
	date: "$Date$"
	revision: "$Revision$"

class
	SIF_IE_WEB_PAGE
inherit

	SIF_INTERACTION_ELEMENT
		redefine
			make
		end

create
	make

feature -- Creation

	make (an_interaction_element_identifier: INTEGER_64; a_sorted_set_of_interaction_elements : SIF_INTERACTION_ELEMENT_SORTED_SET; a_type: like {SIF_ENUM_INTERACTION_ELEMENT_TYPE}.type; a_descriptor: like descriptor )
		do
			Precursor (an_interaction_element_identifier, a_sorted_set_of_interaction_elements, a_type, a_descriptor)
		end

feature -- Access

	web_page_representor: detachable FUNCTION [TUPLE[WSF_REQUEST], WSF_HTML_PAGE_RESPONSE ]

feature -- Element change

	put_web_page_presentor( a_web_presentor: like web_page_representor)
		do
			web_page_representor := a_web_presentor
		end

feature -- Event types


feature {NONE} -- Implementation


note
	copyright: "Copyright (c) 2014-2017, SMA Services"
	license:   "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			SMA Services
			Website: http://www.sma-services.com
		]"

end
