require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character)
  #make the web request
  all_characters = RestClient.get('http://www.swapi.co/api/people/')
  character_hash = JSON.parse(all_characters)
  characters = character_hash["results"]
  filmInfo = []

  hashFound = characters.find do |hash|
    hash["name"] == character
  end["films"].each do  |url|
    film = RestClient.get(url)
    filmHash = JSON.parse(film)
    filmInfo << filmHash
  end
  # characters.each do |hash|#array
  #     if hash["name"] == character
  #
  #         hash["films"].each do |url|
  #           film = RestClient.get(url)
  #           filmHash = JSON.parse(film)
  #           filmInfo << filmHash
  #         end
  #
  #     end
  # end
  filmInfo
    #Check to see if it's == to character
    # if characters["name"] == character
    #   characters["films"].each do |url|
    #   binding.pry
    # end
  #
  # end
  # iterate over the character hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `parse_character_movies`
  #  and that method will do some nice presentation stuff: puts out a list
  #  of movies by title. play around with puts out other info about a given film.
end

def parse_character_movies(films_hash)
  films_hash.each do |film|
    puts "***************************"
    puts "Title: " + film["title"]
    puts "Director: " + film["director"]
    puts "Producer: " + film["producer"]
    puts "Release Date: " + film["release_date"]
  end
end

def show_character_movies(character)
  films_hash = get_character_movies_from_api(character)
  parse_character_movies(films_hash)
end

## BONUS
get_character_movies_from_api("Luke Skywalker")
# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
