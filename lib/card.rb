class Card
  NUMBERS = %w(A 2 3 4 5 6 7 8 9 0 B D K)
  RED_COLORS = %w(♥︎ ♦︎ )
  BLACK_COLORS = %w(♠︎ ♣︎ )
  COLORS = RED_COLORS + BLACK_COLORS

  attr_reader :number, :color

  def initialize(number, color, turned=false)
    @number = number.to_s
    @color = color.is_a?(Integer) ? COLORS[color] : color
    @turned = turned
  end

  def ==(other_card)
    self.number == other_card.number && self.color == other_card.color
  end

  def following?(card)
    if card.nil?
      number_index == 0
    else
      prev == card
    end
  end

  def next
    return nil if number_index > NUMBERS.length - 2
    Card.new(NUMBERS[number_index+1], color)
  end

  def prev
    return nil if number_index < 1
    Card.new(NUMBERS[number_index-1], color)
  end

  def turn!
    @turned = !@turned
  end

  def turned?
    @turned
  end

  def to_s
    number + color
  end

  def display
    turned? ? to_s : 'XX'
  end

  def number_index
    NUMBERS.find_index(number)
  end

end
