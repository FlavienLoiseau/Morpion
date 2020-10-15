class Board
  attr_accessor :array

  def initialize
    @array = Array.new(3) { Array.new(3) { " " } }
  end

  # affiche le plateau
  def display
    puts "     1     2     3"
    puts "  ┌─────┬─────┬─────┐ "
    puts "A │  #{@array[0][0]}  │  #{@array[1][0]}  │  #{@array[2][0]}  │"
    puts "  ├─────┼─────┼─────┤ "
    puts "B │  #{@array[0][1]}  │  #{@array[1][1]}  │  #{@array[2][1]}  │"
    puts "  ├─────┼─────┼─────┤ "
    puts "C │  #{@array[0][2]}  │  #{@array[1][2]}  │  #{@array[2][2]}  │"
    puts "  └─────┴─────┴─────┘"
  end
  
  # cette case est-elle pleine ?
  def is_box_full(column, line)
    if @array[column][line] != " "
      return true
    else
      return false
    end
  end
  
  # un joueur a-t-il aligné 3 pions ?
  def is_winner(mark)
    3.times do |c = 0|
      if @array[c][0] == mark && @array[c][1] == mark && @array[c][2] == mark
        return true
      end
    end
    3.times do |l = 0|
      if @array[0][l] == mark && @array[1][l] == mark && @array[2][l] == mark
        return true
      end
    end
    if @array[0][0] == mark && @array[1][1] == mark && @array[2][2] == mark
      return true
    end
    if @array[0][2] == mark && @array[1][1] == mark && @array[2][0] == mark
      return true
    end 
    return false
  end

end