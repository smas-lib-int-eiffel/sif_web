note
	description: "Summary description for {SIF_COMMAND_WEB_PAGE}."
	author: "Paul Gokke"
	date: "$Date$"
	revision: "$Revision$"

class
	SIF_COMMAND_WEB_PAGE

inherit
	SIF_COMMAND_WEB
		rename
			caption_identifier as Iei_web_page_caption
		end

create make

feature -- Initialization

	make(a_command_identifier: like identifier)
		do
			command_descriptors.put ("web_page_commmand", a_command_identifier)
			make_command(a_command_identifier)
		end

feature -- Execution

	do_execute( si : SIF_SYSTEM_INTERFACE )
		do
		end

feature --

	put_web_page_presentor( a_web_presentor: like {SIF_IE_WEB_PAGE}.web_page_representor )
		require
			web_presentor_exists: attached a_web_presentor
		do
			web_presentor := a_web_presentor
		end

feature -- Interaction

	do_publish_caption( an_ie_caption: SIF_IE_EVENT)
		-- Identify this interactor by setting a caption, which can be used for presentation by the system interface
		do
			an_ie_caption.event_label.publish ("Web page presentor")
		end

feature -- Access


feature {NONE} -- Interaction elements

	do_prepare_interaction_elements
			-- Prepare the necessary interaction elements for the interactor
		do
			create_interaction_elements
		end

	create_interaction_elements
			-- Prepare the necessary interaction elements for the interactor
		local
			ie_web_page: SIF_IE_WEB_PAGE
		do
			if attached result_interaction_elements as l_interaction_elements then
				l_interaction_elements.wipe_out
				create ie_web_page.make(Iei_web_page, l_interaction_elements, {SIF_ENUM_INTERACTION_ELEMENT_TYPE}.enum_result, "ie web page")
				ie_web_page.put_web_page_presentor (web_presentor)
			end
		end

feature {NONE} -- Implementation

	web_presentor: like {SIF_IE_WEB_PAGE}.web_page_representor
			-- Keep track of the web presentor

end
