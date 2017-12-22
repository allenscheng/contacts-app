Rails.application.routes.draw do

  post 'user_token' => 'user_token#create'
  post "/users" => "users#create"

  get "/contacts" => "contacts#index"
  post "/contact" => "contacts#create"
  get "/contact/:id" => "contacts#show"
  patch "/contact/:id" => "contacts#update"
  delete "/contact/:id" => "contacts#destroy"
end

#in order for the url to work: "rails server" needs to run in the terminal to create a local server