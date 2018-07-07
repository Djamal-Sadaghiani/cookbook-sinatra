class Recipe
  attr_reader :name, :description, :difficulty, :time
  attr_accessor :read
  def initialize(name, description, difficulty = "", time = "", read)
    @name = name
    @description = description
    @difficulty = difficulty
    @time = time
    @read = read
  end
end
