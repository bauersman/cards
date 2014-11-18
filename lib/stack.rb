class Stack
  attr_reader :name

  def initialize(name)
    @name = name
    @cards = []
  end

  def push(card)
    return false unless can_receive?(card)
    @cards << card
    true
  end

  def can_receive?(card)
    return false unless card.is_a?(Card)
    card.following?(@cards.last)
  end
end
