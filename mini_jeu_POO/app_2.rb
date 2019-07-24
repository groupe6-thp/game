require "bundler"
Bundler.require

require_relative "lib/game"
require_relative "lib/player"

 	dash = "-" * 60
 	space1 = " " * 15
 	space2 = " " * 10
 	puts dash
 	puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO'  ! #{space1}|"   
 	puts "|Le but de jeu est d'être le dernier survivant ! #{space2}|"
 	puts dash   


 	HumanPlayer.initialization 
 	user = HumanPlayer.new("tonie")
 	player1 = Player.new("josiane")
 	player2 = Player.new("jose")

 	Array_enemies = [player1, player2]

 while user.life_points > 0 && (player1.life_points > 0 || player2.life_points > 0)
 	user.show_state
 	## menu d'ations
			puts "Quelle action veux_tu effectuer ?"
			puts "   "
			puts "\t a - chercher une meilleure arme" 
			puts "\t s - chercher à se soigner"
			puts "   "
			puts "attaquer un joueur en vue :"
			puts "\t 0 - Josiane a 10 points de vie"
			puts "\t 1 - José a 10  points de vie"
		 choice = gets.chomp.to_s
		print ">"
		case choice
			when choice == 0 || choice == 1

			puts "voici l'état de nos joueurs:"
			puts "     "
				puts player1.show_state
				puts player2.show_state
			when choice == "a"
				puts user.search_weapson
			when choice == "s"
				puts user.search_health_pack
			when choice == "0"
				puts user.attack(player1)
			when choice == "1"
				puts user.attack(player2)
		end

		puts "Les autres joueurs t'attaquent!"
		Array_enemies.each do |enemie|
			if enemie.life_points > 0
				puts enemie.attack(user)
			else
				puts "#{enemie} est mort"
			end
		end

	end


