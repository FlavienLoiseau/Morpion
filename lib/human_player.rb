class HumanPlayer
  attr_accessor :name, :mark_type

  def initialize(name, mark_type)
    @name = name
    @mark_type = mark_type
  end

  # insère le pion du joueur dans @array
  def plays(column, line, array)
    array[column][line] = @mark_type
  end

end