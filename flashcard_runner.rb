require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/turn'
require './lib/card_generator'


class Game
  
  attr_reader :round
  
  def initialize(round)
    @round = round
    @card_count = round.deck.count
    @categories = round.deck.cards.map(&:category).uniq
  end
  
  def start
    puts "Welcome! You're playing with #{round.deck.count} cards."
    puts '-------------------------------------------------'
    new_turn
  end
  
  def new_turn
    puts "This is card number #{round.turns.count + 1} out of #{@card_count}."
    puts "Question: #{round.current_card.question}"
    guess = gets.strip
    new = round.take_turn(guess)
    puts new.feedback
    if round.deck.cards.empty?
      end_game
    else
      new_turn
    end
  end
  
  def end_game
    puts '****** Game over! ******'
    puts "You had #{round.number_correct} correct guesses out of #{@card_count} for a total score of #{round.percent_correct.round(0).to_i}%."
    @categories.each do |category|
      puts "#{category} - #{round.percent_correct_by_category(category)}% correct"
    end
  end

end

# card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
# card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
# card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
# deck = Deck.new([card_1, card_2, card_3])
deck = Deck.new(CardGenerator.new('cards.txt').cards)
round = Round.new(deck)
Game.new(round).start

