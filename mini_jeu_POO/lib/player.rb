require 'pry'


## modémliser un joueur, ses caractéristiques
class Player
	attr_accessor :name, :life_points  ## deux attribut d'un objet player

## objet en entrée
	def initialize(name)
		@name = name
		@life_points = 10
	end

	def show_state
		puts "#{self.name} a #{self.life_points} points de vie."
	end

## methode qui va calculer le nombre de dommage lors d'un attaque d'un joueur contre un autre

	def compute_damage
		return rand(1..6) ## nombre de domage aléatoire commen un dé
	end

## subir une attaque avec gets_damage, métode indispensable pour un combat
	def gets_damage(damage_received)
		@life_points = @life_points - damage_received
		if @life_points <= 0
			puts "le joueur #{self.name} a été tué !" 
		else
			puts "Le joueur #{self.name} est encore vivant"
		end
	end

## le joueur attaque avec méthode attack

	def attack(player_2)
		number_of_damage = compute_damage
		player_2.life_points = player_2.life_points - compute_damage
			
			puts " Le joueur #{self.name} attaque le joueur #{player_2.name}"
			puts "Il lui inflige #{number_of_damage} points de domages"
			puts "#{player_2.name} attaque #{self.name}"
			puts player_2.gets_damage(compute_damage)
	end
end

###### version 2 du jeu Player, avec héritage

class HumanPlayer < Player
	attr_accessor :weapon_level
	def initialize(name)	## modification de l'attribut des joueurs
		@name =  name	
		@life_points = 100
		@weapon_level = 1
		super(name)
	end

### on a ajoutée une nouvlle attribut dans l'affichage de l'état

	def show_state
		puts "#{self.name} a #{self.life_points} points de vie et une arme de niveau #{weapon_level}"
	end


## méthode qui multiplie les dégats à infliger grace à la nouvelle arme
	def compute_damage
		add = rand(1..6) * weapon_level

	end 

## méthode qui recherche une arme beaucoup plus puissante

	def search_weapon
		result = rand(1..6)
		puts "tu as trouvé une arme de niveau #{result}"
		if result > @weapon_level
			@weapon_level = result-1
			puts "youhou ! elle est meilleure que ton arme actuelle : tu la prends"
		else
			puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
		end
	end


## méthode qui recherche un pack soin 


	def search_health_pack
		result2 = rand(1..6)
		case result2
		when result2 = 1
			puts "Tu n'a rien trouvé.."
		when result2 >= 2 && result2 <= 5
			if @life_points < 50
			@life_points = @life_points + 50
			else
			@life_points = 100
			end
			 	puts "Bravo, tu as trouvé un pack de +50 points de vie"
		when result2 = 6
			if @life_points < 20
				@life_points = @life_points + 80
			else
				@life_points = 100
			end
			puts "Waou!, tu as trouvé un pack de +80 points de vie"
		end

	end

	def self.initialization
		puts " Le jeu va bientôt commencer, mais creeant d'abord un profil"
		puts " Veuiller entrer votre Prenom svp : "
		last_name =  gets.chomp
		print ">"
		@name = last_name
		return  last_name
	end


end


