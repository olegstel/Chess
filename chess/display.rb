require 'byebug'
require 'colorize'
require_relative 'cursor'

class Display
    attr_reader :cursor
  def initialize(board)
    # byebug
    @cursor = Cursor.new([0,0])
    @board = board
  end

  def render(cursor = @cursor)
    system("clear")
    (0..7).each do |row|
      display_row = ""
      (0..7).each do |col|
        if cursor.cursor_pos == [row, col]
          display_row += @board[[row, col]].to_s.colorize( :background => :red)
        else
          display_row += @board[[row, col]].to_s
        end
      end
    puts display_row
    end
  end

  # def update_cursor_position(pos)
  #   @cursor.cursor_pos = pos
  # end

  def move
    self.render(cursor)
    # byebug
    input = @cursor.get_input
    while input == nil
      self.render(cursor)
      input = @cursor.get_input
    end
  end
end
#
