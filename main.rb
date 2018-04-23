require("./game")

print "What is player one's name? "
p1_name = STDIN.gets.chomp
print "What is player two's name? "
p2_name = STDIN.gets.chomp


# game = Game.new(Player.new(p1_name), Player.new(p2_name))
# game = Game.new_with_full_players(p1, p2)

game = Game.new(p1_name, p2_name)

game.run_game