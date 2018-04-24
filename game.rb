require('./question')


class Game
    
    def initialize(players)
        @loser = false;
        @players = players
        @num_players = players.length
    end

    def turn(player_a)
        question = Question.new
        print "#{player_a.name}: " + question.get_formatted_question
        guess = STDIN.gets.chomp.to_i
        if(!question.correct?(guess))
            puts "#{player_a.name}: Seriously? NO!"
            player_a.reduce_lives
            if(player_a.lives == 0)
                @loser = true
            end
            puts display_score(player_a);
        else
            puts "#{player_a.name}: YES! you are correct."
            puts display_score(player_a)
        end
    end

    def display_score(player_a)
        "#{player_a.name} #{player_a.lives}/3"
    end

    def run_game()
        puts "Lets play!"
        puts "---- First Turn ----"

            loop do
            i = 0
            break if @loser
            while i < @num_players do
                break if @loser 
                turn(@players[i])
                puts "---- New Turn ----"
                i+= 1
            end
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