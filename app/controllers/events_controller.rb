require 'httparty'

class EventsController < ApplicationController
  before_action :authenticate_user!
  include IterableApiInterface::Events
  
  def create_event_a
    event_type = "Event A"
  
    event_data = call_user_events_mailer_api(current_user.id,event_type)

    # event_b_request = APIMocker.generate_event_b_request
     
    # send_event_b_email(event_b_request)

    respond_to do |format|
      format.json { render json: event_data }
      format.js 
    end
  end

  def create_event_b
    #  # Send email notification for Event B
    #  send_email_for_event_b(current_user.email)

     render json: { message: 'Event B created successfully and email notification sent' }
  end

  # def send_event_b_email(request_body)
  #   # Send the email notification using the request body for Event B
  #   # Use HTTParty, RestClient, or any other HTTP client library to make the POST request
  #   # response = HTTParty.post("https://api.iterable.com/api/email/target", body: request_body.to_json, headers: { 'Content-Type': 'application/json' })
   
  
  #   # Handle the response as needed
  #   # if response.success?
  #     binding.pry
  #     EventBMailer.notification(request_body[:recipientEmail]).deliver_now
  #     flash[:notice] = "Email notification for Event B sent successfully."
  #   # else
  #   #   # Error handling
  #   # end
  # end
end
