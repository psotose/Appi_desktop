
class DesksController < ApplicationController
  def index
    generator = PhraseGenerator.new()
    @phrase = generator.get_phrase()
  end
end
