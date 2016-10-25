module SlidingPiece
  def moves(direction)
    current_row, current_col = self.position

    possible_moves = Array.new[]

     case direction
     when :vertical, :horizontal
        (0..7).each do |i|
          posible_moves << [i, current_col]
          posible_moves << [current_row, i]
        end
     when :diagonal
       (0..7).each do |i|
         posible_moves << [current_row + i, current_col + i]
         posible_moves << [current_row - i, current_col - i]
       end
     when :both
       (0..7).each do |i|
         posible_moves << [i, current_col]
         posible_moves << [current_row, i]
         posible_moves << [current_row + i, current_col + i]
         posible_moves << [current_row - i, current_col - i]
       end

       possible_moves = possible_moves.select do |pos|
        (0..7).include?(pos[0]) && (0..7).include?(pos[1])
      end

      possible_moves.delete(self.position)
      possible_moves
     end
  end
end
