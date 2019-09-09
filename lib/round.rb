class Round
  
  attr_reader :deck, :turns
  
  def initialize(deck)
    @deck = deck
    @turns = []
  end
  
  def current_card
    deck.cards.first
  end
  
  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    @turns << new_turn
    deck.cards.shift
    new_turn
  end
  
  def number_correct
    turns.count do |turn|
      turn.correct?
    end
  end
  
  def number_correct_by_category(category)
    turns.count do |turn|
      turn.correct? if turn.card.category == category
    end
  end
  
  def percent_correct
    (number_correct.to_f / turns.count.to_f) * 100.to_f
  end
  
  def percent_correct_by_category(category)
    (number_correct_by_category(category).to_f / turns.count { |turn| turn.card.category == category}.to_f) * 100.to_f
  end
end