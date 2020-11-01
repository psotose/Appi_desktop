
class DesksController < ApplicationController
  def index
    ####To generate 1 phrase
    generator = PhraseGenerator.new()
    @phrase = generator.get_phrase()

    ####To get the USD currency exchange rate
    exchange_gen = CurrencyExchange.new()
    @exchange =exchange_gen.get_exchange_rate
  end
end
