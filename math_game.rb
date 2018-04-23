require('./question')
require('./player')

def round(player_a, player_b)
    question = Question.new
    print "#{player_a.name}:  What is #{question.first_number} + #{question.second_number}? "
    guess = gets.chomp.to_i
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


def setup_game
    players = []
    p1 = Player.new('Player One')
    p2 = Player.new('Player Two')
    players << p1
    players << p2
    puts "Lets play MATH_GAME!!!"
    puts "---- First Turn ----"
    run_game(players)
end

def run_game(players)

    loop do
        round(players[0], players[1])
        break if players[0].lives == 0
        puts "---- New Turn ----"
        round(players[1], players[0])
        break if (players[1].lives == 0)
        puts "---- New Turn ----"
    end
    
    players.sort_by! do |player|
        -player.lives
    end
    
    puts "----   -----   ----"
    puts "#{players[0].name} wins with a score of #{players[0].lives}/3"
    puts "---- GAME OVER ----"
    puts "Good bye!"
end

setup_game