require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character_name)
  #make the web request
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)
  

  # iterate over the response hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `print_movies`
  #  and that method will do some nice presentation stuff like puts out a list
  #  of movies by title. Have a play around with the puts with other info about a given film.
character_films = nil

if response_hash["results"][0]["name"] == character_name 
  character_films = response_hash["results"][0]["films"]
end


  # response_hash.each do |key, value| 
  #   if key == "results" 
  #     value.each do |attribute|
  #       attribute.each do |key, value|
  #         if value == character_name
  #           character_hash << attribute["films"]
  #         end
  #       end
  #     end
  #   end
  # end

  
  character_films.map do |url|
    movie_hash = RestClient.get(url)
    response_movie_hash = JSON.parse(movie_hash)
  end


end


def print_movies(films)
  films.each_with_index do |film, i|
    puts "#{i+1}. #{film["title"]}"
  end


end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
  films
end



## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
