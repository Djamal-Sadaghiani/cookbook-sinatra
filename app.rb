require "sinatra"
require "sinatra/reloader" if development?
require "pry-byebug"
require "better_errors"
require_relative 'cookbook'
require_relative 'recipe'
require_relative 'scraper'

set :bind, '0.0.0.0'

csv_file   = File.join(__dir__, 'recipes.csv')
cookbook   = Cookbook.new(csv_file)
results = []

configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = File.expand_path('..', __FILE__)
end


get '/' do
  @cookbook = cookbook.all
  erb :index
end

get '/read/:index' do
  cookbook.read(params[:index].to_s.to_i)
  redirect '/'
end

get '/delete/:index' do
  cookbook.remove_recipe(params[:index].to_s.to_i)
  redirect '/'
end

get '/add/:index' do
  # binding.pry
  cookbook.add_recipe(results[params[:index].to_s.to_i])
  redirect '/'
end

post '/search' do
  search = params[:keyword].gsub(" ","+")
  @results = Scrapper.scrap(search)
  results = @results
  erb :search
end
