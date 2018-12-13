note
	description: "Summary description for {SIF_COMMAND_WEB_MEDIA}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	SIF_COMMAND_WEB_MEDIA

inherit
	SIF_COMMAND_WEB
		rename
			caption_identifier as Iei_web_media_caption
		end

create make

feature -- Initialization

	make
		do
			command_descriptors.put ("web_media_command", Ci_web_media)
			descriptors.put ("ie web media", Iei_web_media)
			descriptors.put ("media_name", Iei_media_name)

			make_command(Ci_web_media)
		end

feature -- Execution

	do_execute( si : SIF_SYSTEM_INTERFACE )
		do
			if attached result_interaction_elements as l_results_ies then
				if attached {SIF_IE_TEXT}l_results_ies.interaction_element (Iei_web_media) as l_ie_web_media then
					l_ie_web_media.put_input (interaction_element_string_value (Iei_media_name))
				end
			end
		end

feature -- Interaction

	do_publish_caption( an_ie_caption: SIF_IE_EVENT)
		-- Identify this interactor by setting a caption, which can be used for presentation by the system interface
		do
			an_ie_caption.event_label.publish ("Web media presentor")
		end

feature {NONE} -- Interaction elements

	do_prepare_interaction_elements
			-- Prepare the necessary interaction elements for the interactor
		do
			create_interaction_elements
		end

	create_interaction_elements
			-- Prepare the necessary interaction elements for the interactor
		do
			create_text_result_element(Iei_web_media)
			create_mandatory_query_element(Iei_media_name)
		end

end

