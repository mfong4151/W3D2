require_relative "board"
require_relative "card"

class Game

    def prompt
        # must check if the card in the chosen position is facing down
        print "please enter a position for the guess: "
        guess_1 = gets.chomp.split(" ")
        guess_1 = [guess_1.first.to_i, guess_1.last.to_i]
        
        #print "please enter a position for the second guess | format: 1 1 -> 1 (space) 1"
        #guess_2 = gets.chomp.split(" ")
        #guess_2 = [guess_2.first.to_i,guess_2.last.to_i]

        if guess_1 == "exit"
            exit
        end
        return guess_1
    end

    def initialize

        #Reevaulate these
        @board = Board.new
        @guessed_pos = "" # store a instance of card
        @previous_guess = -1 # store a instance of card

    end

    def guess_management(guess)
        @previous_guess = guess
    end

    def play
        while !@board.won? # loop until there are no unrevealed cards
            
            render  # should call render inst method

            guess_1 = prompt
            @previous_guess = guess_1
            card_1 = @board[guess_1]
            card_1.reveal
            render 

            guess_2 = guess_1
            until guess_2 != guess_1
                guess_2 = prompt   #get prompt
                if guess_2 == guess_1
                    print "your 2nd guess must be another guess"
                    next
                end
                card_2 = @board[guess_2]
                card_2.reveal
            end
            render

            if !make_guess(card_1, card_2) #guess
                card_1.hide
                card_2.hide
                sleep(3)
            else
                print "YOU GOT A MATCH :DDDDDD!!!"
                sleep(3)
            end
            render
   
        end

        p "Game over"

    end

    def render #print
        system("clear")

        @board.grid.each do |row|
            #print board[i]
            row.each do |ele|

                if ele.face_up # must be true to NOT reveal the cards
                    print ele.face_value

                else
                    print " _ "

                end
            end
            puts
            
        end
        
    end
    
    def make_guess(card_1, card_2)
        # compare guess 1 and guess 2
        card_1.face_value == card_2.face_value
    end


end


g = Game.new

g.play
