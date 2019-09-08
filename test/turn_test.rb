require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/card'

class TurnTest < MiniTest::Test
  def test_it_exists
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("This is a guess", card)
    
    assert_instance_of Turn, turn
  end
  
  def test_it_has_a_guess
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    guess = "This is a guess"
    turn = Turn.new(guess, card)
    
    assert_equal guess, turn.guess
  end
  
  def test_it_has_a_card
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("This is a guess", card)
    
    assert_equal card, turn.card
  end
  
  def test_it_can_return_true_if_correct_guess
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    
    assert_equal true, turn.correct?
  end
  
  def test_it_can_return_false_if_incorrect_guess
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Guess", card)
    
    assert_equal false, turn.correct?
  end
  
  def test_it_can_return_feedback_for_correct
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    
    assert_equal 'Correct!', turn.feedback
  end
  
  def test_it_can_return_feedback_for_incorrect
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Guess", card)
    
    assert_equal 'Incorrect.', turn.feedback
  end
end
