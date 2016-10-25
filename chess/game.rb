require_relative 'board'
class Game

  def initialize(board)
    @board = board
    @display = Display.new(@board)
  end

  def get_move
    puts " What position would you like to move?"
    sleep(2)
    start_pos = @display.move
    if @board.empty_position?(start_pos)
      puts "Sorry pal, that's not a piece!"
      return
    end
    puts "Where would you like to move it?"
    sleep(2)
    end_pos = @display.move

    if check_move?(start_pos, end_pos)
      @board.move_piece(start_pos, end_pos)
    end
  end

  def check_move?(start_pos, end_pos)
    piece = @board[start_pos]
    @board.is_path_clear?(end_pos, piece)
  end



end
