require 'uri'
require 'net/http'
require 'openssl'

class CurrencyExchange < ApplicationService
  END_POINT_USD = "https://currency-exchange.p.rapidapi.com/exchange?q=1.0&from=USD&to=CLP"
  
  ##usd media exchange rate
  def initialize()
    url = URI(END_POINT_USD)
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Get.new(url)
    request["x-rapidapi-host"] = 'currency-exchange.p.rapidapi.com'
    request["x-rapidapi-key"] = 'bec1ff373cmsh0698a70e7d37776p1f39fbjsn790a2ff3e39e'
    response = http.request(request)
    @exchange = response.read_body
  end  

  def get_exchange_rate()
    @exchange.to_f.round(2)
  end  
end