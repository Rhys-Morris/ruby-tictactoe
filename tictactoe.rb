# Handle duplicate entry

# WELCOME MESSAGE
puts "----------------------------"
puts "Welcome to Tictactoe!"
puts "Grab a friend and get ready to play!"
puts "Enter y when ready to start"
puts "----------------------------"
puts ""

# CHECK PLAYER READY
start = gets.chomp
if start != "y"
    return
end

# DEFINE GAMEBOARD CLASS AND HELPER FUNCTIONS
class Gameboard
    attr_accessor :markers
    attr_reader :turn_count, :winner

    MAXTURNS = 9

    ## Initialize content of markers to position in array
    def initialize
        @markers = []
        position = 0
        9.times do
            self.markers.push(position)
            position = position + 1
        end
        @current_turn = "X"
        @turn_count = 0
        @winner = false
    end

    def print_board()
        puts ""
        puts "#{@markers[0]} | #{@markers[1]} | #{@markers[2]}"
        puts "----------"
        puts "#{@markers[3]} | #{@markers[4]} | #{@markers[5]}"
        puts "----------"
        puts "#{@markers[6]} | #{@markers[7]} | #{@markers[8]}"
        puts ""
    end

    def check_turn()
        puts ""
        puts "It is #{@current_turn}'s turn!"
        puts ""
        puts "Enter the number of the square you wish to select"
        puts ""
    end

    def take_turn()
        selection = gets.chomp
        while @markers[selection.to_i] == "X" || @markers[selection.to_i] == "O"
            puts ""
            puts "Position already selected - please select again"
            selection = gets.chomp
        end
        @markers[selection.to_i] = @current_turn
        @turn_count = @turn_count + 1
        print_board()
        check_winner()        
        if @current_turn == "X"
            @current_turn = "O"
        else
            @current_turn = "X"
        end
    end

    def check_winner()
        puts "----- Checking for winner ----- \n\n"

        # Vertical win conditions

        if @markers[0] == @markers[3] && markers[0] == @markers[6]
            puts "The winner is #{@current_turn}!"
            @winner = true
            return
        end

        if @markers[1] == @markers[4] && markers[1] == @markers[7]
            puts "The winner is #{@current_turn}!"
            @winner = true
            return
        end

        if @markers[2] == @markers[5] && markers[2] == @markers[8]
            puts "The winner is #{@current_turn}!"
            @winner = true
            return
        end

        # Horizontal win conditions

        if @markers[0] == @markers[1] && markers[0] == @markers[2]
            puts "The winner is #{@current_turn}!"
            @winner = true
            return
        end

        if @markers[3] == @markers[4] && markers[3] == @markers[5]
            puts "The winner is #{@current_turn}!"
            @winner = true
            return
        end

        if @markers[6] == @markers[7] && markers[6] == @markers[8]
            puts "The winner is #{@current_turn}!"
            @winner = true
            return
        end

        # Diagonal win conditions

        if @markers[0] == @markers[4] && markers[0] == @markers[8]
            puts "The winner is #{@current_turn}!"
            @winner = true
            return
        end

        if @markers[2] == @markers[4] && markers[2] == @markers[6]
            puts "The winner is #{@current_turn}!"
            @winner = true
            return
        end
        
        ## Check whether game is a tie!
        if @turn_count == MAXTURNS
            puts "Game is a tie!"
            @winner = true
            return
        end
    end
end

# Create new game instance
new_game = Gameboard.new()
new_game.print_board()

# Start game
while new_game.turn_count < 9 do
    new_game.check_turn()
    new_game.take_turn()
    if new_game.winner
        puts "Thanks for playing!"
        break
    end
end