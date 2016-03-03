require "net/https"
require "uri"
require "json"

module Risingtide
  class Client
    attr_accessor :subscriber_number, :access_token, :client_id, :client_password, :shortcode, :usagetype, :mask

    ENDPOINT_OAUTH = "https://developer.globelabs.com.ph/oauth/"

    # Creates an instance of a globe client.
    #
    # Options:
    # => access_token - Access token if available
    # => passphrase - The passphrase if provided
    def initialize(app_id, app_secret, options = {})
      @app_id, @app_secret, @access_token, @passphrase = app_id, app_secret, options[:access_token], options[:passphrase]
    end
  end
end
