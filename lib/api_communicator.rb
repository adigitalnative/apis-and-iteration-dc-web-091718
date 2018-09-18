require 'rest-client'
require 'json'
require 'pry'

STAR_WARS_API_URL = 'http://www.swapi.co/api/people/'

def get_character_movies_from_api(character)

  response_hash = api_request(STAR_WARS_API_URL)

  character_info = response_hash["results"].find {|name| name['name'] == character }

  film_urls = character_info["films"]
  
  film_urls.map do |film_url|
    api_request(film_url)
  end

end

def print_movies(films_hash)
  # some iteration magic and puts out the movies in a nice list
  films_hash.each do |film|
    puts film["title"]
  end
end

def show_character_movies(character)
  films_array = get_character_movies_from_api(character)
  print_movies(films_array)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?

def api_request(url)
  response_string = RestClient.get(url)
  JSON.parse(response_string)
end







