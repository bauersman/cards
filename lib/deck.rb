require 'delegate'

class Deck < DelegateClass(Array)
  def initialize
    build_deck
    super(@cards)
  end

  def top_card
    @cards.last
  end

  # push top card to the bottom
  def rotate!
    @cards.rotate!(-1)
  end

  private

  def build_deck
    @cards = Card::COLORS.map do |color|
      Card::NUMBERS.map do |number|
        Card.new(number, color)
      end
    end.flatten.shuffle
  end
end
