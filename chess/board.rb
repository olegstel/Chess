require 'byebug'
require_relative 'piece'
require_relative 'display'
class Board

attr_accessor :grid

[Rook, Knight, Bishop, King, Queen, Bishop, Knight, Rook]
DEFAULT_BOARD = {
  [0, 0] => Rook.new([0, 0], :black),
  [0, 1] => Knight.new([0,1], :black),
  [0, 2] => Bishop.new([0,2], :black),
  [0, 3] => King.new([0,3], :black),
  [0, 4] => Queen.new([0,4], :black),
  [0, 5] => Bishop.new([0,5], :black),
  [0, 6] => Knight.new([0,6], :black),
  [0, 7] => Rook.new([0,7], :black),

  [1, 0] => Pawn.new([1,0], :black),
  [1, 1] => Pawn.new([1,1], :black),
  [1, 2] => Pawn.new([1,2], :black),
  [1, 3] => Pawn.new([1,3], :black),
  [1, 4] => Pawn.new([1,4], :black),
  [1, 5] => Pawn.new([1,5], :black),
  [1, 6] => Pawn.new([1,6], :black),
  [1, 7] => Pawn.new([1,7], :black),

  [7,0] => Rook.new([7,0], :white),
  [7,1] => Knight.new([7,1], :white),
  [7, 2] => Bishop.new([7,2], :white),
  [7, 3] => King.new([7,3], :white),
  [7, 4] => Queen.new([7,4], :white),
  [7, 5] => Bishop.new([7,5], :white),
  [7, 6] => Knight.new([7,6], :white),
  [7, 7] => Rook.new([7,7], :white),

  [6, 0] => Pawn.new([6,0], :white),
  [6, 1] => Pawn.new([6,1], :white),
  [6, 2] => Pawn.new([6,2], :white),
  [6, 3] => Pawn.new([6,3], :white),
  [6, 4] => Pawn.new([6,4], :white),
  [6, 5] => Pawn.new([6,5], :white),
  [6, 6] => Pawn.new([6,6], :white),
  [6, 7] => Pawn.new([6,7], :white)
}

def initialize()
  @grid = create_grid
  populate_board
end

def create_grid
  Array.new(8) { Array.new(8)}
end

def populate_board
  empty = NullPiece.instance
  DEFAULT_BOARD.each do |k,v|
    self[k] = v
  end
  place_null_pieces
end

def place_null_pieces
  (2..5).to_a.each do |row|
    (0..7).to_a.each do |col|
      pos = [row, col]
      self[pos] = NullPiece.instance
    end
  end
end

def [](pos)
  row, col = pos
  @grid[row][col]
end

def []=(pos, piece)
  x, y = pos
  @grid[x][y] = piece
end

def move_piece(start_pos, end_pos)
  piece = self[start_pos]

  begin
    empty_position?(start_pos)
  rescue ArgumentError => e
    puts "#{e.messages}"
  end

  begin
    piece.valid_move?(end_pos, self)
  rescue ArgumentError => e
    puts "#{e.message}"
  end

    piece.position = end_pos
    self[end_pos] = piece
    self[start_pos] = NullPiece
end


  def empty_position?(pos)
    unless self[pos] != NullPiece
      raise ArgumentError.new("Start position is not empty")
    end
  end




  def in_bound?(pos)
    row, col = pos
    (0..7).include?(row) && (0..7).include?(col)
  end


end
# ddd = Board.new
# disp = Display.new(ddd)
# disp.render
# disp.move
