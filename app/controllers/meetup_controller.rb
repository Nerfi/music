class MeetupController < ApplicationController
  def index
    @events = Meetup.com.events
    render json:@events

  end
end
