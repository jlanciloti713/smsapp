class PagesController < ApplicationController
  def index

  end

  def incoming_sms
    twilio_sid = ENV['TWILIO_SID']
    twilio_token = ENV['TWILIO_TOKEN']
    twilio_phone_number = ENV['TWILIO_PHONE_NUMBER']

    sender_number = params["From"]
    incoming_message = params["Body"]
    message = "I AM A ROBOT"

    if incoming_message == "Secret"
      message = "You've unlocked a secret."
    else
      message = "NORMALITY"
    end
    @client = Twilio::REST::Client.new(twilio_sid, twilio_token)
    @client.messages.create(
      :from => twilio_phone_number,
      :to => sender_number,
      :body => message
      )
    render :nothing => true
  end
end
