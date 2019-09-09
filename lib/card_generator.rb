require './lib/card'

class CardGenerator
  
  attr_reader :filename, 
              :cards
  
  def initialize(filename)
    @filename = filename
    @cards = generate_cards
  end
  
  def generate_cards
    file = File.open(filename, 'r')
    file.each_line.map do |line|
      info = line.strip.split(',')
      Card.new(info[0], info[1], info[2].to_sym)
    end
  end
end