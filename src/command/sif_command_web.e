note
	description: "Summary description for {SIF_COMMAND_WEB}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	SIF_COMMAND_WEB

inherit
	SIF_COMMAND
		redefine
			make_command
		select
			is_equal,
			copy
		end

	SIF_SHARED_INPUT_VALIDATORS
		undefine
			default_create
		end

	SIF_COMMAND_IDENTIFIERS_WEB_EWF
		undefine
			default_create
		end

	SIF_INTERACTION_ELEMENT_IDENTIFIERS_WEB
		undefine
			default_create
		end

feature {NONE} -- Initialization

	make_command (a_command_identifier: INTEGER_64)
			-- Create a new command with `a_command_identifier'.
		do
			Precursor(a_command_identifier)
		end

end
