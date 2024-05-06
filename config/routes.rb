Rails.application.routes.draw do
  get 'home/index'
  devise_for :users
  root to: "home#index"
  post 'events/create_event_a', to: 'events#create_event_a'
  post 'events/create_event_b', to: 'events#create_event_b'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
