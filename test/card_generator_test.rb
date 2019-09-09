require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/card_generator'

class CardGeneratorTest < MiniTest::Test
  
  def test_it_exists
    cg = CardGenerator.new('cards.txt')
    
    assert_instance_of CardGenerator, cg
  end
  
  def test_it_has_a_filename
    cg = CardGenerator.new('cards.txt')
    
    assert_equal 'cards.txt', cg.filename
  end
  
  def test_it_creates_cards
    cg = CardGenerator.new('cards.txt')
    
    assert_instance_of Card, cg.cards.first
    assert_equal 4, cg.cards.count
    assert_equal "What is 5 + 5?", cg.cards.first.question
    assert_equal "10", cg.cards.first.answer
    assert_equal :STEM, cg.cards.first.category
  end
end