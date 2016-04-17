class Recipe
  include HTTParty
  key_value = ENV['FOOD2FORK_KEY']
  hostport = ENV['FOOD2FORK_SERVER_AND_PORT'] || 'www.food2fork.com'
  base_uri("http://#{hostport}/api/search")

  # Add HTTP query parameter `key` (my developer key) to each outgoing URL request
  #  to http://food2fork.com/api using HTTParty default.params
  default_params(key: key_value)
  format(:json)

  def self.for(term)
    # Query Food2Fork API using provided 'term'
    response = get("", query: { q: term })["recipes"]
    return response
  end
end
