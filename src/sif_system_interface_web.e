note
	description: "Summary description for {SIF_SYSTEM_INTERFACE_WEB}."
	author: "Paul Gokke"
	date: "$Date$"
	revision: "$Revision$"
	library: "System Interface Framework (SIF)"
	legal: "See notice at end of class."

deferred class
	SIF_SYSTEM_INTERFACE_WEB
	inherit
		SIF_SYSTEM_INTERFACE


feature -- Destruction

	destroy
		do
			-- Currently empty, assuming a web service is never destroyed.
		end

;note
	copyright: "Copyright (c) 2014-2016, SMA Services"
	license:   "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			SMA Services
			Website: http://www.sma-services.com
		]"

end
