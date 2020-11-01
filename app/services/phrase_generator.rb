require "uri"
require "net/http"
require 'json'

class PhraseGenerator < ApplicationService
  attr_reader :phrases

  END_POINT = "https://type.fit/api/quotes"
  
  def initialize()
    url = URI(END_POINT)
    https = Net::HTTP.new(url.host, url.port);
    https.use_ssl = true  
    request = Net::HTTP::Get.new(url)
    request["Cookie"] = "__cfduid=d3ed0ceef928437135a80294e681e839b1603931539"
    response = https.request(request)
    @phrases = JSON.parse(response.read_body)
  end

  def get_phrase()
    @phrases[0]['text']
    @phrases[rand(@phrases.count)]['text']
    
  end  

end  