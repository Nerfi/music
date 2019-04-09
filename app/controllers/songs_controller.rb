class SongsController < ApplicationController
    require 'open-uri'
    require 'json'
  def search
    url = 'https://api.spotify.com/v1/search'
    user_serialized = open(url).read
    @results = JSON.parse(user_serialized)







       # Avoid requesting info from API if there was no search query
    q = params[:q]
    return unless q.present?

    # Request info from API
    require 'net/http'
    uri = URI.parse("https://api.spotify.com/v1/search?" + { q: q, type: 'track' }.to_query)
    json = Net::HTTP.get(uri)

    # Turn JSON-formatted string into Ruby data structure and make it available to the view
    @results = JSON.parse(json)["tracks"]["items"]


  end
end
