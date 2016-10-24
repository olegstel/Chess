require_relative 'board'
require 'colorize'
require_relative 'cursor'

class Display
    attr_reader :cursor
  def initialize(board)
    @cursor = Cursor.new([0,0], board)
    @board = board
  end

  def render
    (0..7).each do |row|
      display_row = ""
      (0..7).each do |col|
        if @cursor.cursor_pos == [row, col]
          display_row += @board[[row, col]].to_s.colorize( :background => :red)
        else
          display_row += @board[[row, col]].to_s
        end
      end
    puts display_row
    end
  end

  def update_cursor_position(pos)
    @cursor.cursor_pos = pos
  end

  def move
    @cursor.get_input
  end
end

ddd = Board.new
disp = Display.new(ddd)

 disp.render
