require 'byebug'
module SteppingPiece

  def moves
    if self.class == Knight
      get_knight_moves(self.position)
    elsif self.class == King
        get_king_moves(self.position)
    end
  end

  def get_king_moves(pos)
    valids = []
    row, col = pos
    3.times do |i|
      i += -1
      3.times do |j|
          j += -1
          move = [row + i, col + j]
        valids << move if move.all? { |el| (0...8).include?(el) }
      end
    end
    valids.delete(pos)
    valids
  end

  def get_knight_moves(pos)
    valids = []

    2.times do |i|
      if  i == 0
        x = 1
        y = 2
      else
        x = 2
        y = 1
      end
      4.times do |j|
        case j
        when 0
          valid_move = [pos[0] + x, pos[1] + y]
        when 1
          valid_move = [pos[0] - x, pos[1] - y]
        when 2
          valid_move = [pos[0] + x, pos[1] - y]
        when 3
          valid_move = [pos[0] - x, pos[1] + y]
        end
        valids << valid_move if valid_move.all? { |el| (0...8).include?(el) }

      end
    end

  valids
  end
end
