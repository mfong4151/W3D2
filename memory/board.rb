require_relative "card"

class Board
    
    def self.get_length
        p "please insert dimensions of the board (example: '3', for a 3x3 grid)"
        ui = gets.chomp.to_i
        ui
    end
   
    def initialize #input 2 =<
        ui = Board.get_length
        @grid = Array.new(ui) { Array.new(ui, "_") }
        populate
    end

    # [["_", "_", "_", "_"]
    # ["_", "_", "_", "_"]
    # ["_", "_", "_", "_"]
    # ["_", "_", "_", "_"]]

    # [["_", "_", "_", "_"]
    # ["_", "_", "_", "_"]
    # ["_", "_", "_", "_"]
    # ["_", "_", "_", "_"]]

    # [[0, 0], [0, 1], [0,2]]
    attr_reader :grid

    def get_all_positions
        positions = []
        (0...@grid.length).each do |i|

            (0...@grid.length).each do |j|
                # debugger
                positions << [i,j]
            end

        end
        positions
    end

    def [](position)
        @grid[position.first][position.last]
    end


    def []=(position, value)
        @grid[position.first][position.last] = value
    end

    def populate
        pairs = (@grid.length**2)/2
        alphabet = ('a'..'z').to_a
        positions = get_all_positions
        pairs.times do |i|
            #create an instance, 
            #shovel into the ith element of grid
            #pairs
            random_no = positions.delete_at(rand(0...positions.length))
            random_no_2 = positions.delete_at(rand(0...positions.length))
            letter_to_insert = alphabet.delete_at(rand(0...alphabet.length))
            
            @grid[random_no.first][random_no.last] = Card.new(letter_to_insert)
            @grid[random_no_2.first][random_no_2.last] = Card.new(letter_to_insert)
        end

        if positions != []
            pos = positions.delete_at(0)
            @grid[pos.first][pos.last] = Card.new(":D")
        end

    end


    def render

    end

    def won?
        @grid.flatten.all?{|i| i.face_up == true }

    end

    def reveal

    end
end


