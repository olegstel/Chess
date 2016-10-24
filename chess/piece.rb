require 'singleton'
class Piece

  attr_accessor :position
  attr_reader :color

  def initialize(position, color)
    @position = position
    @color = color
  end
end


class NullPiece < Piece
  include Singleton
  def initialize
  end
end

class Pawn < Piece
  def to_s
    "P"
  end
end

class Knight < Piece
  def to_s
    "H"
  end
end

class Bishop < Piece
  def to_s
    "B"
  end
end

class Queen < Piece
  def to_s
    "Q"
  end
end

class King < Piece
  def to_s
    "K"
  end
end

class Rook < Piece
  def to_s
    "R"
  end
end
