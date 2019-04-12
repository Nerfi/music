class Meetup
  include HTTParty
  base_uri 'api.meetup.com'

  def get_data
    self.class.get('/operation-code-hampton-roads/events')
  end

  def events
    if get_data.code.to_i == 200
      get_data.parsed_response
    else
      raise "Error fetching data from Meetup API"
    end
  end
end
