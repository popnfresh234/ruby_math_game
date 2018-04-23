require('./question')
require('./player')

class Game
    
    def initialize(p1_name, p2_name)
        @players = []
        p1 = Player.new(p1_name)
        p2 = Player.new(p2_name)
        @players << p1
        @players << p2
        puts "Lets play!"
        puts "---- First Turn ----"
    end

    def turn(player_a, player_b)
        question = Question.new
        print "#{player_a.name}:  What is #{question.first_number} + #{question.second_number}? "
        guess = STDIN.gets.chomp.to_i
        if(!question.correct?(guess))
            puts "#{player_a.name}: Seriously? NO!"
            player_a.reduce_lives
            puts display_score(player_a, player_b);
        else
            puts "#{player_a.name}: YES! you are correct."
            puts display_score(player_a, player_b)
        end
    end

    def display_score(player_a, player_b)
        "#{player_a.name} #{player_a.lives}/3 vs #{player_b.name} #{player_b.lives}/3"
    end

    def run_game()

        loop do
            turn(@players[0], @players[1])
            break if @players[0].lives == 0
            puts "---- New Turn ----"
            turn(@players[1], @players[0])
            break if (@players[1].lives == 0)
            puts "---- New Turn ----"
        end
        
        @players.sort_by! do |player|
            -player.lives
        end
        
        puts "----   -----   ----"
        puts "#{@players[0].name} wins with a score of #{@players[0].lives}/3"
        puts "---- GAME OVER ----"
        puts "Good bye!"
    end
end