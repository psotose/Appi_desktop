
class DesksController < ApplicationController
  def index
    ####To generate 1 phrase
    generator = PhraseGenerator.new()
    @phrase = generator.get_phrase()

    ####To get the USD currency media exchange rate
    exchange_gen = CurrencyExchange.new()
    @exchange =exchange_gen.get_exchange_rate

    ####To get the weather forecast in SCL
    weather_gen = WeatherForecast.new()
    @weather = weather_gen.get_weather
  end
end
