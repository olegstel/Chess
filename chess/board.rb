require 'byebug'
require_relative 'piece'
class Board


DEFAULT_BOARD = {[0,0] => Rook.new([0,0], :black),
                  [0,1] => Knight.new([0,1], :black),
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
  DEFAULT_BOARD.each do |k,v|
    # byebug
    @grid[k[0]][k[1]] = v
  end
end

def [](pos)
  x, y = pos[0], pos[1]
  @grid[x][y]
end

def []=(pos, piece)
  x, y = pos[0], pos[1]
  @grid[x][y] = piece
end

end
