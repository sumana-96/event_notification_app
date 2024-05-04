module IterableApiInterface
    module Events
        def call_user_events_mailer_api(user_id, event_type)

            event_data = MakeApiCall.getHttpApiCall(user_id, event_type)
            binding.pry

            if event_data[:status] == 200
                InterableMail.send_mail(event_data[:body][:email], event_type)
            end
        end

        def list_user_events(user_id, event_type)
            event_data = MakeApiCall.postHttpApiCall(user_id, event_type)
            
        end
    end

    module InterableMail
        def self.send_mail(email,type)
            EventBMailer.notification(email,type).deliver_now
        end
    end

    module MakeApiCall
        class << self
            def getHttpApiCall(user_id, event_type)
                return {
                    status:200,
                    body: APIMocker.mock_event_a_response(user_id , event_type)
                }
            end
            def postHttpApiCall(user_id, event_type)
                return {
                    status:200,
                    body: APIMocker.mock_event_a_response(user_id , event_type)
                }
            end
        end
    end
end