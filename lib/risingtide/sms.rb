require 'uri'
require 'net/http'
require 'json'

module Risingtide
  module Sms
    class RequestError < StandardError
      attr_accessor :message
      def initialize message
        @message = message
      end
    end

    def send_sms(username, password, shortcode, to, body, usagetype, from_alias)
      url = URI("http://api.wyrls.net/documents")

      http = Net::HTTP.new(url.host, url.port)

      request = Net::HTTP::Post.new(url)
      request["content-type"] = 'application/vnd.net.wyrls.Document-v3+json'
      request.basic_auth username, password
      request["cache-control"] = 'no-cache'
      request.body = {
                      from: shortcode,
                      to: to,
                      content_type: "text/plain",
                      body: body,
                      usagetype: usagetype,
                      date: Time.now,
                      from_alias: from_alias,
                     }.to_json

      response = http.request(request)
      JSON.parse(response.body).tap { |r| raise RequestError.new(r["error"]) if r["error"] }
    end
  end
end
