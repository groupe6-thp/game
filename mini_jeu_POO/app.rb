require "bundler"
Bundler.require

require_relative "lib/game"
require_relative "lib/player"

player1 = Player.new("josiane")
player2 = Player.new("josé")

	while player1.life_points > 0 && player2.life_points > 0

		break if player2.life_points <= 0 || player1.life_points <= 0
			
		if player1.life_points > 0 && player2.life_points > 0 

			puts "voici l'état de nos joueurs:"
			puts  player1.show_state
			puts  player2.show_state
			puts  "-----------------------------------------------------------------------------------------------------"
			puts "Passons à la phase d'attaque:"
			puts player1.attack(player2)
			puts player2.attack(player1)
			puts "......................................................................................................."
		end
	end

		
