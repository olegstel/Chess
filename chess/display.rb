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
    puts "This is a work in progress -- Pawns have godlike abilities"
    system("clear")
    (0..7).each do |row|
      display_row = ""
      (0..7).each do |col|
        piece = @board[[row, col]]
        if cursor.cursor_pos == [row, col]
          display_row += piece.to_s.colorize( :background => :red)
        elsif piece == NullPiece.instance
          display_row += "_"
        else
          display_row += piece.to_s.colorize(piece.color)
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
   input
  end
end
#
