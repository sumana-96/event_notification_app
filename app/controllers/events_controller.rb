class EventsController < ApplicationController
  before_action :authenticate_user!
  include IterableApiInterface::Events
  
  def create_event_a
    event_type = "Event A"
    event_data = call_user_events_mailer_api(current_user,event_type)
    respond_to do |format|
      format.json { render json: event_data }
      format.js 
    end
  end

  def create_event_b
    event_type = "Event B"
    event_data = call_user_events_mailer_api(current_user,event_type)
    respond_to do |format|
      format.json { render json: event_data }
      format.js 
    end
  end
end
