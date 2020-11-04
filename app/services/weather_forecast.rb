require 'uri'
require 'net/http'
require 'openssl'

class WeatherForecast < ApplicationService
  END_POINT_SCL = "https://community-open-weather-map.p.rapidapi.com/weather?lat=0&lon=0&callback=test&id=2172797&lang=null&units=%2522metric%2522%20or%20%2522imperial%2522&mode=xml%252C%20html&q=London%252Cuk"
  
  def initialize()
    begin
      url = URI(END_POINT_SCL)
      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE 
      request = Net::HTTP::Get.new(url)
      request["x-rapidapi-host"] = 'community-open-weather-map.p.rapidapi.com'
      request["x-rapidapi-key"] = ENV['RAPIDAPI']
      response = http.request(request)
      puts response.code
      puts response.read_body 
      if response.code != 200
        @weather = "Lo sentimos, no podemos mostrarte el clima en estos momentos"
      else
        body = response.read_body
        @weather = body['main']['temp']
      end
    rescue StandardError => e
      @weather = 'Fallo el programa ' + e.message
    end    
  end  

  def get_weather
    @weather
  end  
end