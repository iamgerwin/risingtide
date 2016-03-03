require "net/https"
require "uri"
require "json"

module Risingtide
  module Sms
    class RequestError < StandardError
      attr_accessor :message
      def initialize message
        @message = message
      end
    end

    ENDPOINT_SMS = "http://api.wyrls.net/documents"

    attr_accessor :access_token, :shortcode, :password

  end
end
