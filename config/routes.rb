Rails.application.routes.draw do
  # get "/first_contact_url" => "contacts#first_contact"
  # get "/second_contact_url" => "contacts#second_contact"
  # get "/third_contact_url" => "contacts#third_contact"
  # get "/all_contact_url" => "contacts#all_contact"
  get "/contact" => "contacts#index"
  post "/contact" => "contacts#create"
  get "/contact/:id" => "contacts#show"
  patch "/contact/:id" => "contacts#update"
  delete "/contact/:id" => "contacts#destroy"
end

#in order for the url to work: "rails server" needs to run in the terminal to create a local server