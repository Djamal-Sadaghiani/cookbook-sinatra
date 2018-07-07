class View
  def ask_for_recipe
    puts "What's the name of the new recipe?"
    print "> "
    return gets.chomp
  end

  def ask_for_description
    puts "What's the description?"
    print "> "
    return gets.chomp
  end

  def ask_for_index
    puts "What's the index?"
    print "> "
    return gets.chomp.to_i
  end

  def list_recipes(recipes)
    recipes.each_with_index do |recipe, index|
      x = " "
      x = "X" if recipe.read == true
      puts "#{index + 1}. [#{x}] #{recipe.name} (#{recipe.time})"
    end
  end

  def ask_for_search
    puts "What's the keyword you are trying to search for?"
    print "> "
    return gets.chomp
  end
end
