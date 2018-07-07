require 'csv'
require_relative 'recipe'

class Cookbook
  attr_reader :recipes
  def initialize(csv)
    @csv = csv
    @recipes = []
    read_csv(@csv)
  end

  def read_csv(csv)
    CSV.foreach(csv) do |row|
      @recipes << Recipe.new(row[0], row[1], row[2], row[3], row[4])
    end
  end

  def all
    @recipes
  end

  def add_recipe(recipe)
    @recipes << recipe
    write_csv
  end

  def remove_recipe(recipe_index)
    @recipes.delete_at(recipe_index)
    write_csv
  end

  def write_csv
    CSV.open(@csv, 'wb') do |csv|
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description, recipe.difficulty, recipe.time, recipe.read]
      end
    end
  end
end

