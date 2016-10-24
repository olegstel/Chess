require 'singleton'
class Piece

  attr_accessor :position
  attr_reader :color

  def initialize(position, color)
    @position = position
    @color = color
  end
  def valid_move?(position)
    board[position] == NullPiece ||
      board[position].color != self.color
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

  def moves
  end

  protected

  def valid_move?(pos)
     super(pos)
    if self.in_starting_position?
      spaces_ahead_empty(pos, 2)
      spaces_ahead_empty(pos, 1)
    elsif
      if spaces_ahead_empty(pos, 1)

      else
        check_diagonals
      end
    end
  end

  def check_diagonals(pos)
    row, col = pos
    if self.color == :while

    else
  end


  def spaces_ahead_empty?(position, spaces_forward)
    row, col = position
    if self.color == :while
      board[row - spaces_forward, col] == NullPiece
    else
      board[row + spaces_forward, col] == NullPiece
    end
  end



  def forward_dir
    if self.color == :white
      :up
    else
      :down
    end
  end

  def forward_steps(pos)
     row, col = self.pos
    if self.at_start_row?
      if forward_dir ==  :up
        [[row + 1, col], [row + 2, col]]
      else
        [[row -1, col], [row - 2, col]]
      end
    else
      if forward_dir ==  :up
        [[row + 1, col]]
      else
        [[row -1, col]]
      end
  end

  def side_attacks(pos)
    if forward_dir ==  :up
      [[row + 1, col + 1], [row + 1, col - 1]]
    else
      [[row -1, col + 1], [row - 1, col -1 ]]
    end
  end

  def at_start_row?
    if self.color == :while
      position[0] == 6
    else
      position[0] == 1
    end
  end

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
