class Game
  attr_accessor :players, :board

  def initialize(player1, player2)
    # initialisation du plateau
    @board = Board.new
    # initialisation des joueurs humains
    @player1 = HumanPlayer.new(player1, "X".light_red)
    @player2 = HumanPlayer.new(player2, "O".light_cyan)
  end

  # fonctionnement normal d'un tour de jeu
  def drives(round)

    # affiche le plateau
    system "clear"
    @board.display

    # sélectionne le joueur
    if round %2 != 0
      player = @player1
    else
      player = @player2
    end

    # demande au joueur de choisir une case qui soit vide
    puts "Le tour #{round} commence !"
    puts "-------------------------"
    puts "#{player.name}, où veux-tu jouer ?"
    print "> "
    entry = gets.chomp.upcase
    line = entry.chars[0].ord - 65
    column = (entry.chars[1].to_i) -1

    # on vérifie que le joueur ait entré une bonne case et qu'elle ne soit pas pleine
    if ["A1","B1","C1","A2","B2","C2","A3","B3","C3"].none?(entry) || board.is_box_full(column, line)
      return "erreur"
    end

    # le joueur pose son pion sur une case vide
    player.plays(column, line, @board.array)

    # le joueur de ce tour a-t-il gagné ?
    if @board.is_winner(player.mark_type) == true
      end_game(player)
    end

  end

  def end_game(winner)

    # nettoie et affiche le résultat
    system "clear"
    @board.display

    # affichage du vainqueur
    puts ""
    puts "!!!".light_green
    if winner == "match_nul"
      puts "Vous n'avez pas réussi à vous départager, match nul".light_green
    else
      puts "#{winner.name} a gagné, bravo à lui/elle".light_green
    end
  
    # est-ce qu'on relance une partie ?
    puts ""
    puts "Voulez-vous relancer une partie ?"
    puts "O: oui / N: non"
    print "> "
    choice = gets.chomp.upcase
    if choice == "O"
      my_game = Game.new(@player1.name, @player2.name)
      perform(my_game)
    else
      exit
    end
  
  end

end