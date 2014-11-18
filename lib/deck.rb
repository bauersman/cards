require 'delegate'

class Deck < DelegateClass(Array)
  def initialize(turned=false)
    @turned = turned
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

  def shuffle!
    @cards.shuffle!
    self
  end

  def turn!
    reverse!
    @cards.each(&:turn!)
    @turned = !@turned
  end

  def turned?
    @turned
  end

  private

  def build_deck
    @cards = Card::COLORS.map do |color|
      Card::NUMBERS.map do |number|
        Card.new(number, color, @turned)
      end
    end.flatten
  end
end
