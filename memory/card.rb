class Card

    

    attr_reader :face_up, :face_value

    def initialize(value)
        @face_value = value.upcase
        @face_up = false #false == down true == up
        
        if @face_value == ":D"
            @face_up = true
        end
    end

    def switch_face
        # check if two cards have the same value, and if
        # thats true, switch their values to true
    end

    def hide
        @face_up = false if @face_up

    end

    def reveal
        unless @face_up
            @face_up = true 
            return @face_value
        end
        " "

    end
    
    def to_s

    end

    def == (other_card)
        @face_value == other_card.face_value

    end

end

