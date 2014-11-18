require 'delegate'

class Row < DelegateClass(Array)
  attr_reader :name, :cards

  def initialize(name)
    super(@cards=[])
    @name = name
  end

  def turn_top
    @cards.last.turn!
  end

  def top_card
    @card.last
  end

  def bottom_card
    @card.first
  end

  def can_receive?(cards)
    case cards
    when Row then cards.bottom_card.follows?(self.top_card)
    when Card then card.follows?(self.top_card)
    else false
    end
  end

  def display
    cards.map(&:display).join(' ')
  end
end
