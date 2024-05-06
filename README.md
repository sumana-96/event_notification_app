![image](https://github.com/sumana-96/event_notification_app/assets/100777469/1ae2d85c-db77-4a41-a722-6ef7d0d82a52)# event_notification_app
a simple web-based application using Ruby on Rails (RoR) that integrates with the iterable.com API.
# README
How to setup
  1. Clone the app from git
  2. Go to the project folder
  3. do 'bundle install'
  4. start the rails server

Things to cover:

Module: APIMocker

Description:
  This module provides methods to mock API responses and requests for testing purposes.

Methods:

1. mock_event_a_response(user, eventType)
   - Description: Mocks a response for Event A creation.
   - Parameters:
     - user: User object representing the user for whom the event is being created.
     - eventType: String representing the type of event being created.
   - Returns: Hash representing the mock response for Event A creation.

2. mock_event_b_response(user_id)
   - Description: Mocks a response for Event B creation.
   - Parameters:
     - user_id: Integer representing the ID of the user for whom the event is being created.
   - Returns: Hash representing the mock response for Event B creation.

3. generate_event_b_request(email, eventType)
   - Description: Generates a request body for creating Event B and triggers an email notification.
   - Parameters:
     - email: String representing the email address of the recipient.
     - eventType: String representing the type of event being created.
   - Returns: Hash representing the request body for creating Event B.

Additional Notes:
- The methods in this module utilize the Faker gem to generate fake data for mocking API responses and requests.
- The generate_event_b_request method also triggers an email notification using the EventMailer class, assuming it is properly implemented in the application.


This code defines a module called IterableApiInterface which contains three nested modules: Events, InterableMail, and MakeApiCall. Here's an explanation of each module and its functionality:

1. IterableApiInterface::Events:
   - This module contains a method called call_user_events_mailer_api, which is responsible for calling the MakeApiCall.getHttpApiCall method and then sending an event email if the HTTP call is successful.
   - It takes two parameters: user (representing the user object) and event_type (representing the type of event).
   - Inside the method, it calls MakeApiCall.getHttpApiCall with the provided user and event_type.
   - If the HTTP call is successful (status code 200), it calls InterableMail.send_event_email to send the event email using the provided email and event_type.

2. IterableApiInterface::InterableMail:
   - This module contains a class method called send_event_email, which is responsible for sending an event email.
   - It takes two parameters: email (representing the recipient email address) and event_type (representing the type of event).
   - Inside the method, it calls APIMocker.generate_event_b_request to generate the request body for the event email.
   - It returns a hash with status 200 and the generated request body.

3. IterableApiInterface::MakeApiCall:
   - This module contains a class method called getHttpApiCall, which is responsible for making an HTTP API call to mock the response for Event A creation.
   - It takes two parameters: user (representing the user object) and event_type (representing the type of event).
   - Inside the method, it calls APIMocker.mock_event_a_response to mock the response for Event A creation.
   - It returns a hash with status 200 and the mocked response body.

Overall, this code simulates an API interface for interacting with an Iterable-like service to manage events and send event emails based on the provided user and event type.

This code defines an EventsController class which inherits from ApplicationController. Here's an explanation of the code:


1. before_action :authenticate_user!: This line specifies that the authenticate_user! method from Devise should be called before any action in the controller, ensuring that the user is authenticated before accessing these actions.

2. include IterableApiInterface::Events: This line includes the Events module from the IterableApiInterface namespace into the controller, allowing the controller to access the methods defined in that module.

3. def create_event_a: This method defines an action for creating Event A. Inside the method:
   - It sets the event_type variable to "Event A".
   - It calls the call_user_events_mailer_api method from the Events module with the current user and the event_type.
   - It responds to different formats (JSON and JavaScript) with the event data returned from the API call.

4. def create_event_b: This method defines an action for creating Event B. Inside the method:
   - It sets the event_type variable to "Event B".
   - It calls the call_user_events_mailer_api method from the Events module with the current user and the event_type.
   - It responds to different formats (JSON and JavaScript) with the event data returned from the API call.

Overall, this code sets up an EventsController with actions for creating Event A and Event B. These actions authenticate the user, include the Events module, and then call the call_user_events_mailer_api method to interact with the Iterable-like service and send event emails based on the current user and event type.

This HTML code provides a basic login form using Devise, along with buttons for triggering Event A and Event B functionality. Let's break down the code:

1. Login Form:
   - The login form is wrapped in a <div> with the class container for styling purposes.
   - It contains a <h2> heading with the text "Log in".
   - Inside the form, there are two fields for entering email and password, labeled appropriately with <label> tags.
   - The email field is created using <%= f.email_field :email %>, and the password field is created using <%= f.password_field :password %>.
   - If the Devise configuration includes the rememberable module, a checkbox for "Remember me" is displayed.
   - The form submits to the session_path with the method post.

2. Links:
   - Below the form, there are two links:
     - "Forgot your password?" which links to the password reset page (new_password_path).
     - "Sign up" which links to the registration page (new_registration_path) if registration is enabled in the Devise configuration.

3. Styling:
   - The CSS styles provided in the <style> block are used to style the login form and its elements.
   - Styles include font styles, input field styling, button styling, and layout adjustments for responsiveness.

4. Event A and Event B Buttons:
   - These buttons are not part of the login form but can be included on the same page for additional functionality.
   - They can trigger JavaScript functions or make AJAX requests to the server to perform actions related to Event A and Event B.

Overall, this code provides a clean and simple login form using Devise, along with links for password recovery and user registration. Additionally, it can be extended to 

include functionality for triggering Event A and Event B actions.



