note
	description: "Summary description for {SIF_CONFIGURATION_WEB}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	SIF_CONFIGURATION_WEB

inherit
	ALPHA_CONFIGURATION
		redefine
			default_create
		end

feature -- Initialization

	default_create
			--
		do
			Precursor
			create self
			create media_server_resource_path
		end

feature -- Access

	self: ALPHA_CFG_TCP_IP
			-- TCP/IP configuration for stand alone operation

	media_server_resource_path: ALPHA_CFG_FILE
			-- The path to be used for the standard media resources

end
