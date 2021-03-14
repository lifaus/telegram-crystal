require "json"
require "http"
require "./**"

module Telegram
  class Client

    @token : String | Array(String)

    def initialize(token : String | Array(String))
      @token = token
    end

    def post(method : String)
      HTTP::Client.post(url_for(method))
    end

    def post_form(method : String, params : Hash)
      HTTP::Client.post(url_for(method), form: params)
    end

    def post_multipart(method : String, params)
      HTTP::Client.post_multipart(url_for(method), params)
    end

    protected def url_for(method) : String
      "https://api.telegram.org/bot#{@token}/#{method}"
    end

    def send(message : String, chat_id : Int32, add_fields={} of String => String)
      return self.post_form("sendMessage", {
        "chat_id" => chat_id.to_s,
        "text" => message.to_s
      }.merge!(add_fields))
    end
  end
end