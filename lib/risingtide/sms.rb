require 'uri'
require 'net/http'
require 'json'

module Risingtide
  class Sms
    class RequestError < StandardError
      attr_accessor :message
      def initialize message
        @message = message
      end
    end

    attr_accessor :username, :password, :shortcode, :usagetype, :from_alias

    def initialize(username = nil, password = nil, shortcode = nil, usagetype = nil, from_alias = nil)
      @username = username
      @password = password
      @shortcode = shortcode
      @usagetype = usagetype
      @from_alias = from_alias
    end

    def send_sms(to, body, time = Time.now)
      url = URI("http://api.wyrls.net/documents")

      http = Net::HTTP.new(url.host, url.port)

      request = Net::HTTP::Post.new(url)
      request["content-type"] = 'application/vnd.net.wyrls.Document-v3+json'
      request.basic_auth username, password
      request["cache-control"] = 'no-cache'
      request.body = {
                      from: shortcode,
                      to: to.gsub(/[+]/, ""),
                      content_type: "text/plain",
                      body: body,
                      usagetype: usagetype,
                      date: time,
                      from_alias: from_alias,
                     }.to_json

      http.request(request)
    end
  end
end
