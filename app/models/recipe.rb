# class Recipe
#   include HTTParty
#   key_value = ENV['FOOD2FORK_KEY']
#   hostport = ENV['FOOD2FORK_SERVER_AND_PORT'] || 'www.food2fork.com'
#   base_uri("http://#{hostport}/api/search")

#   # Add HTTP query parameter `key` (my developer key) to each outgoing URL request
#   #  to http://food2fork.com/api using HTTParty default.params
#   default_params(key: key_value)
#   format(:json)

#   def self.for(term)
#     # Query Food2Fork API using provided 'term'
#     response = get("", query: { q: term })["recipes"]
#     return response
#   end
# end


# Thanks Vitor and Trevor I very much appreciate your willing to help.
# As i said, the app is working fine with the class definition bellow, so i'm
# assuming the app is reading in the environment variables I set in .bash_profile.
# Here is what my Recipe class look like with the environment variables read in.

class Recipe
  include HTTParty
  key_value = ENV['FOOD2FORK_KEY']
  hostport = ENV['FOOD2FORK_SERVER_AND_PORT'] || 'www.food2fork.com'
  base_uri "http://#{hostport}/api"
  default_params key: key_value
  format :json
  puts key_value, hostport, base_uri

  def self.search_for search_term
    get("/search", query:{q: search_term})["recipes"]
  end

end

