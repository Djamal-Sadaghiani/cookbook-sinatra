require_relative 'cookbook'
require_relative 'recipe'
require_relative 'view'
require_relative 'scraper'

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  def list
    @view.list_recipes(@cookbook.all)
  end

  def create
    name = @view.ask_for_recipe
    description = @view.ask_for_description
    @cookbook.add_recipe(Recipe.new(name, description))
  end

  def mark
    index = @view.ask_for_index
    @cookbook.all[index - 1].read = true
  end

  def destroy
    index = @view.ask_for_index
    @cookbook.remove_recipe(index - 1)
  end

  def search
    search = @view.ask_for_search
    results = Scrapper.scrap(search)
    @view.list_recipes(results)
    index = @view.ask_for_index
    @cookbook.add_recipe(results[index - 1])
  end
end


