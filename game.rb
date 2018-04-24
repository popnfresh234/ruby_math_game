

class Game
    
    def initialize(players)  
        @players = players.collect {|name| Player.new(name)}
    end

    def turn(player)
        question = Question.new
        print "#{player.name}: " + question.get_formatted_question
        guess = STDIN.gets.chomp.to_i
        if(!question.correct?(guess))
            puts "#{player.name}: Seriously? NO!"
            player.reduce_lives
            if player.isDead?
                @players.delete_at(@players.index(player))
            end
            puts display_score;
        else
            puts "#{player.name}: YES! you are correct."
            puts display_score
        end
    end

    def display_score()
        output = ''
        @players.each {|player| output += "#{player.name} score: #{player.lives}/3 "}
        output
    end

    def run_game()
        puts "Lets play!"
        puts "---- First Turn ----"

        loop do
            i = 0
            while i < @players.length do
                turn(@players[i])
                i += 1
            end
            break if @players.length == 1
        end
    
        puts "----   -----   ----"
        puts "#{@players[0].name} wins with a score of #{@players[0].lives}/3"
        puts "---- GAME OVER ----"
        puts "Good bye!"
    end
end