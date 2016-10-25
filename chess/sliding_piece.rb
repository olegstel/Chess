module SlidingPiece

  def move_dirs
    if self.class == Queen
      :both
    elsif self.class == Rook
      :vertical
    elsif self.class == Bishop
      :diagonal
    end
  end

  def moves
    direction = move_dirs
    current_row, current_col = self.position
    possible_moves = []

     case direction
     when :vertical, :horizontal
        (0..7).each do |i|
          possible_moves << [i, current_col]
          possible_moves << [current_row, i]
        end
     when :diagonal
       (0..7).each do |i|
         possible_moves << [current_row + i, current_col + i]
         possible_moves << [current_row - i, current_col - i]
       end
     when :both
       (0..7).each do |i|
         possible_moves << [i, current_col]
         possible_moves << [current_row, i]
         possible_moves << [current_row + i, current_col + i]
         possible_moves << [current_row - i, current_col - i]
       end

       possible_moves = possible_moves.select do |pos|
        (0..7).include?(pos[0]) && (0..7).include?(pos[1])
      end

      possible_moves.delete(self.position)
      possible_moves
     end
  end
end
