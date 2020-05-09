class Game
    attr_accessor :letter, :box

    @@board = {}


    def initialize(letter, box)
        @letter = letter
        @box = box
    end
        
    def self.show_table
      puts "     
                   |     |
                   |     |     
              __#{@@board[1]}____#{@@board[2]}______#{@@board[3]}_____
                   |     |
                   |     |     
              __#{@@board[4]}____#{@@board[5]}______#{@@board[6]}_____
                   |     |
                   |     |
                #{@@board[7]}    #{@@board[8]}      #{@@board[9]}   "
    end
    
    def self.start_game
        puts "Ok, so who is Player One? X or O?"
        @letter_player_one = gets.chomp.upcase
        if ["X","O"].include?(@letter_player_one) == false
            puts "You didn't pick a right letter, IDIOT! Try again!"
            self.start_game          
        end
        if @letter_player_one == "X"
           @letter_player_two = "O"
        end
        if @letter_player_one == "O"
           @letter_player_two = "X"
        end
        puts "Ok, Player One, you're \"#{@letter_player_one}\". Which makes Player Two \"#{@letter_player_two}\". Now here's the chart! Remember the numbers for the rest of the game!"
        puts "     
                   |     |
                   |     |     
              __#{1}_____#{2}______#{3}___
                   |     |
                   |     |     
              __#{4}_____#{5}______#{6}___
                   |     |
                   |     |
                #{7}     #{8}      #{9}   "
    end

    def self.get_box
        puts "Where do you want to go, #{@letter_player_one}"
        @box = gets.chomp.to_i
        if (1..9).include?(@box) == false
            puts "What kind of board are you playing on?! Pick 1-9!"
            self.get_box
        end
        if @@board[@box] != nil
            puts "Try again! Theres already an #{@@board[@box]} there!"
            self.get_box
        end
        @@board[@box] = @letter_player_one
        self.show_table
    end

    def self.get_box_two
        puts "Where do you want to go, #{@letter_player_two}"
        @box = gets.chomp.to_i
        if (1..9).include?(@box) == false
            puts "What kind of board are you playing on?! Pick 1-9!"
            self.get_box
        end
        if @@board[@box] != nil
            puts "Try again! Theres already an #{@@board[@box]} there!"
            self.get_box
        end
        @@board[@box] = @letter_player_two
        self.show_table
    end

    def self.win
        if  (@@board[1] == "X" && @@board[2] == "X" && @@board[3] == "X")||
            (@@board[4] == "X" && @@board[5] == "X" && @@board[6] == "X")||
            (@@board[7] == "X" && @@board[8] == "X" && @@board[9] == "X")||
            (@@board[1] == "X" && @@board[4] == "X" && @@board[7] == "X")||
            (@@board[2] == "X" && @@board[5] == "X" && @@board[8] == "X")||
            (@@board[3] == "X" && @@board[6] == "X" && @@board[9] == "X")||
            (@@board[3] == "X" && @@board[5] == "X" && @@board[7] == "X")||
            (@@board[1] == "X" && @@board[5] == "X" && @@board[9] == "X")

            self.show_table
            puts "Yeehaw \"X\" is the Winner"
            exit!

        elsif
            (@@board[1] == "O" && @@board[2] == "O" && @@board[3] == "O")||
            (@@board[4] == "O" && @@board[5] == "O" && @@board[6] == "O")||
            (@@board[7] == "O" && @@board[8] == "O" && @@board[9] == "O")||
            (@@board[1] == "O" && @@board[4] == "O" && @@board[7] == "O")||
            (@@board[2] == "O" && @@board[5] == "O" && @@board[8] == "O")||
            (@@board[3] == "O" && @@board[6] == "O" && @@board[9] == "O")||
            (@@board[1] == "O" && @@board[5] == "O" && @@board[9] == "O")||
            (@@board[3] == "O" && @@board[5] == "O" && @@board[7] == "O")
        
            self.show_table
            puts "Yeehaw \"O\" is the Winner"
            exit!
        end
    end

    def self.play
        self.get_box
        self.win
        self.get_box_two
        self.win
        self.play
    end


  end

Game.start_game
Game.play



