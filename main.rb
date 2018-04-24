require("./game")
require('./player')


num_players = 0
players = []

while num_players < 2
    print "How many players are playing? (min 2) "
    num_players = STDIN.gets.chomp.to_i
end

i = 0
while i < num_players do
    print "What is the player #{i + 1}'s name? "
    players << Player.new(STDIN.gets.chomp)
    i += 1

end

# game = Game.new(Player.new(p1_name), Player.new(p2_name))
# game = Game.new_with_full_players(p1, p2)

game = Game.new(players)

game.run_game