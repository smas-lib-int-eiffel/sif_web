note
	description: "Summary description for {SIF_PRODUCT_WEB}."
	author: "Paul Gokke"
	date: "$Date$"
	revision: "$Revision$"
	library: "System Interface Framework (SIF)"
	legal: "See notice at end of class."

deferred class
	SIF_PRODUCT_WEB

inherit
	SIF_PRODUCT
		redefine
			initialize,
			manufacture
		end

feature {NONE} -- Logging

	use_logging: BOOLEAN
			-- True, means logging is used during execution of the application
		do
			Result := True
		end

feature -- Query

	persistence_storage_name: STRING
		deferred
		end

	base_url: STRING
			-- Result contains the base url of the web product.
			-- This base URL is to be used for creating the correct URI's of the web product.

	scheme: STRING
			-- Result contains the scheme of the web product, e.g. http or https.
			-- This base URL is to be used for creating the correct URI's of the web product.

	port: INTEGER
			-- Result contains the port on which the socket of the web product will be listening.

	external_port: INTEGER
			-- Result contains the port on which the process is communicating from the external environment.

	authority: STRING
			-- Result contains the authority part of the web product
		note
			EIS: "name=Authority", "protocol=URI", "src=https://en.wikipedia.org/wiki/Uniform_Resource_Identifier#Examples"
		do
			Result := scheme + "://" + base_url + ":" + external_port.out
		end

	media_resource_path: STRING
			-- Result contains the path as is to be used in uri's for this web product to obtain
			-- different kinds of media, like images and videos.

	media_query_parameter_name: STRING
			-- Result contains the media query parameter name. This is used to be able to handle different kind of
			-- media related uri's. For example an uri for an image could be:
			-- http://www.example.com/?media_name=image_name.jpg"
			-- This feature denotes the string media_name, which then is used in the handler to be able to handle
			-- these uri's in a generic way. Otherwise it is used to describe uri's in representations of the web product.
		do
			Result := "media_name"
		end

	media_query_value_template: STRING
			-- Result contains a place holder, to be used in template URI's for links
		do
			Result := "{" + media_query_value_template_name + "}"
		end

	media_query_value_template_name: STRING
			-- Result contains a place holder, to be used in template URI's for links
		do
			Result := "media_value_template"
		end

	media_descriptor: STRING
			-- Result contains the generic usable descriptor to a media resource
		do
			Result := media_query_parameter_name
		end

feature -- Access

	is_query_string_based_command_executer: BOOLEAN
		do
			Result := False
		end

	query_string_command_field_name: STRING
		do
			create Result.make_empty
		end

	has_media: BOOLEAN
			-- True, when the web product serves media using the media route as defined by the following features:
			-- media_path and media_query_parameter_name
		do
			Result := false
		end

feature {NONE} -- Manufacturing

	initialize
		-- Do product specific initializations
		do
			create scheme.make_empty
			create base_url.make_empty
			create media_resource_path.make_from_string("/assets/{media_name}")
			import		-- Import base_url, sheme and/or port from config file
			if base_url.is_empty then
				base_url.make_from_string (default_base_url)
			end
			if scheme.is_empty then
				scheme.make_from_string (default_scheme)
			end
			if port = 0 then
				port := default_port
			end
			if external_port = 0 then
				external_port := default_port
			end
			Precursor
		end

	default_base_url: STRING
			-- The default base URL, used when no config file is used with base URL property
		do
			Result := "localhost"
		end

	default_scheme: STRING
			-- The default scheme, used when no config file is used with scheme property
		do
			Result := "http"
		end

	default_port: INTEGER
			-- The default port, used when no config file is used with the port property
		do
			Result := 9090
		end

	manufacture
			-- Manufacture the specific product
		do
			Precursor

			log_web_product_information
		end

feature {NONE} -- Implementation

	log_web_product_information
		do
			write_information ("Manufactured a web product with the following properties.")
			write_information ("%TScheme: " + scheme)
			write_information ("%TBase URL: " + base_url)
			write_information ("%TPort: " + port.out)
			write_information ("%TExternal Port: " + external_port.out)
		end

feature {NONE} -- Implementation

	import
			-- Import web configuration
		local
			l_web_config: JSON_CONFIG_DAO [SIF_CONFIGURATION_WEB]
		do
			create l_web_config.make_from_file ("./config/config_web.json")
			l_web_config.load_for_component(void)
			if
				attached l_web_config.last_item as la_web_config
			then
				base_url := la_web_config.self.base_url
				scheme := la_web_config.self.scheme
				if attached la_web_config.self.port as la_port then
					port := la_port
				end
				if attached la_web_config.self.external_port as la_external_port then
					external_port := la_external_port
				end
				if not la_web_config.media_server_resource_path.path.is_empty then
					media_resource_path.make_from_string (la_web_config.media_server_resource_path.path)
				end
			end
		end

;note
	copyright: "Copyright (c) 2014-2017, SMA Services"
	license:   "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			SMA Services
			Website: http://www.sma-services.com
		]"

end
