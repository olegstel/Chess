require 'byebug'
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
        (0..7).to_a.each do |i|
          possible_moves << [i, current_col]
          possible_moves << [current_row, i]
        end
     when :diagonal
       (0..7).each do |i|
         possible_moves << [current_row + i, current_col + i]
         possible_moves << [current_row - i, current_col - i]
         possible_moves << [current_row + i, current_col - i]
         possible_moves << [current_row - i, current_col + i]
       end
     when :both
       (0..7).each do |i|
         possible_moves << [i, current_col]
         possible_moves << [current_row, i]
         possible_moves << [current_row + i, current_col + i]
         possible_moves << [current_row - i, current_col - i]
         possible_moves << [current_row + i, current_col - i]
         possible_moves << [current_row - i, current_col + i]
       end
     end
     return drop_original_and_off_board(possible_moves, self.position)

   end

   def drop_original_and_off_board(moves, original)
     moves = moves.select do |pos|
       (0..7).include?(pos[0]) && (0..7).include?(pos[1])
     end
     moves.delete(original)
     moves
   end

  def build_straigt_path(start_pos, end_pos)
    path = []
    start_row, start_col = start_pos
    end_row, end_col = end_pos
    if start_row != end_row
      row_arr = [start_row, end_row].sort
      (row_arr[0]..row_arr[1]).each{ |i| path << [i, start_col] }
    else
      col_arr = [start_col, end_col].sort
      (col_arr[0]..col_arr[1]).each{ |i| path << [start_row, i] }
    end
    path
  end


end
