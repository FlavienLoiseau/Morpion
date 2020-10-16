require 'bundler'
Bundler.require

$:.unshift File.expand_path("./../lib", __FILE__)
require 'game'
require 'board'
require 'human_player'

def introduction
  puts "
  ┌─────────────────────────────────────────┐
  │    Bienvenue sur 'MORPION X VS O' !     │
  │ Le but du jeu est d'aligner trois pions │
  └─────────────────────────────────────────┘".light_green

  # demande le nom de chaque joueur
  puts "
  Initialisation des joueurs :
  Comment s'appelle le Joueur 1 (qui va jouer en 1er) ?"
  print "> "
  player1 = gets.chomp
  puts "Comment s'appelle le Joueur 2 ?"
  print "> "
  player2 = gets.chomp

  # initialisation du jeu
  my_game = Game.new(player1, player2)
  perform(my_game)

  # petit effet de style (chargement)
  puts "_________________________"
  puts "Lancement de la partie"
  sleep(1)
  print "."
  sleep(1)
  print "."
  sleep(1)
  print "."
  sleep(1)
end

# méthode qui fait tourner le jeu
def perform(my_game)
  round = 1
  while round <= 9
    if my_game.drives(round) != "erreur"
      round += 1
    end
  end
  # si le plateau est plein, le jeu s'arrête
  my_game.end_game("match_nul")
end

introduction