# #app/service/factory.rb

require 'faker'

module APIMocker
  class << self
    def mock_event_a_response(user_id, eventType)
      {
        contentId: Faker::Number.unique.number(digits: 6),
        recurringCampaignId: Faker::Number.unique.number(digits: 5),
        email: Faker::Internet.email,
        createdAt: Faker::Time.backward(days: 30).iso8601,
        campaignId: Faker::Number.unique.number(digits: 5),
        templateId: Faker::Number.unique.number(digits: 5),
        messageId: Faker::Alphanumeric.alpha(number: 32),
        eventType: "EVENT A emailSend",
        user_id: user_id
      }
    end

    def mock_event_b_response(user_id)
      {
        event: 'event_b_created',
        user_id: user_id,
        event_id: Faker::Alphanumeric.alpha(number: 32)
      }
    end

    def generate_event_b_request
        campaign_id = Faker::Number.number(digits: 5)
        recipient_email = Faker::Internet.email
        # recipient_email = "sumanapaul299@gmail.com"
        data_fields = { customParam: Faker::Lorem.word }
        send_at = Faker::Time.forward(days: 7).iso8601
  
        {
          campaignId: campaign_id,
          recipientEmail: recipient_email,
          dataFields: data_fields,
          sendAt: send_at
        }
    end
  end
end
