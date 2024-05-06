module IterableApiInterface
    module Events
        def call_user_events_mailer_api(user, event_type)
            event_data = MakeApiCall.getHttpApiCall(user, event_type)
            
            if  event_data.present? && event_data[:status] == 200
                InterableMail.send_event_email(event_data[:body][:email], event_type)
            end
        end
    end

    module InterableMail
        class << self
        def send_event_email(email , event_type)
            return {
                status:200,
                body: APIMocker.generate_event_b_request(email, event_type)
            }
        end
       end
    end

    module MakeApiCall
        class << self
            def getHttpApiCall(user, event_type)
                return {
                    status:200,
                    body: APIMocker.mock_event_a_response(user, event_type)
                }
            end
        end
    end
end