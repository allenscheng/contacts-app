require "unirest"
system "clear"
require "pp" #to print on it's own line

while true
   
  puts "Choose an option"
  puts "1 - to view all contacts." 
  puts "  1.1 - to search a first name."
  puts "  1.2 - to search a middle name."
  puts "  1.3 - to search a last name."
  puts "  1.4 - to search an email."
  puts "  1.5 - to search a phone number."
  puts "2 - to create a new contact."
  puts "3 - to view a single contact."
  puts "4 - to update a contact information."
  puts "5 - to delete a contact." 
  puts  
  puts "signup - Signup (create a new user)"
  puts 
  puts "login - Login (create a new web token)"
  puts  
  puts "logout - Logout (erases the web token)"
  puts  
  puts "[q] Quit"
  user_choice = gets.chomp 
  base_url = "http://localhost:3000"

  if user_choice == "1"
    response = Unirest.get("#{base_url}/contact")
    contact = response.body  
    pp contact 
  elsif user_choice == "1.1"
    print "Please enter the first name to search: "
    input_name_search = gets.chomp 
    response = Unirest.get("#{base_url}/contact", parameters: {first_name_search: input_name_search})
    contact = response.body
    pp contact 
  elsif user_choice == "1.2"
    print "Please enter the middle name to search: "
    input_name_search = gets.chomp 
    response = Unirest.get("#{base_url}/contact", parameters: {middle_name_search: input_name_search})
    contact = response.body
    pp contact
  elsif user_choice == "1.3"
    print "Please enter the last name to search: "
    input_name_search = gets.chomp 
    response = Unirest.get("#{base_url}/contact", parameters: {last_name_search: input_name_search})
    contact = response.body
    pp contact
  elsif user_choice == "1.4"
    print "Please enter the email to search: "
    input_email_search = gets.chomp 
    response = Unirest.get("#{base_url}/contact", parameters: {email_search: input_email_search})
    contact = response.body
    pp contact 
  elsif user_choice == "1.5"
    print "Please enter the phone number to search: "
    input_phone_search = gets.chomp 
    response = Unirest.get("#{base_url}/contact", parameters: {phone_number_search: input_phone_search})
    contact = response.body
    pp contact
  elsif user_choice == "2"
    params = {}
    print "Please enter the contacts first name: "
    params["first_name"] = gets.chomp
    print "Please enter the contacts middle name: "
    params["middle_name"] = gets.chomp
    print "Please enter the contacts last name: "
    params["last_name"] = gets.chomp
    print "Please enter the contacts email: "
    params["email"] = gets.chomp
    print "Please enter the contacts phone number (format xxx-xxx-xxxxx): "
    params["phone_number"] = gets.chomp
    print "Please enter a bio: "
    params["bio"] = gets.chomp
    response = Unirest.post("#{base_url}/contact", parameters: params)
    contact = response.body
    pp contact
  elsif user_choice == "3"
    print "Enter the contact id to be seen: "
    contact_id = gets.chomp
    response = Unirest.get("#{"base_url"}/contact/#{contact_id}")
    contact = response.body
    pp contact 
  elsif user_choice == "4"
    print "Enter the contact id that needs to be updated: " 
    params = {}
    contact_id = gets.chomp
    response = Unirest.get("#{base_url}/contact/#{contact_id}")
    contact = response.body
    print "Enter the new first name(#{contact["first_name"]}): "
    params["first_name"] = gets.chomp
    print "Enter the new middle name(#{contact["middle_name"]}): "
    params["middle_name"] = gets.chomp
    print "Enter the new last name(#{contact["last_name"]}): "
    params["last_name"] = gets.chomp
    print "Enter the new email(#{contact["email"]}): "
    params["email"] = gets.chomp
    print "Enter the new phone number(#{contact["phone_number"]}): "
    params["phone_number"] = gets.chomp
    print "Please enter new bio(#{contact["bio"]}): "
    params["bio"] = gets.chomp
    params.delete_if { |_key, value| value.empty? }
    response = Unirest.patch("#{base_url}/contact/#{contact_id}", parameters: params)
    contact = response.body 
    pp contact 
  elsif user_choice == "5"
    print "Enter the contact to delete: "
    contact_id = gets.chomp 
    response = Unirest.delete("#{base_url}/contact/#{contact_id}")
    pp contact = response.body
  elsif user_choice == "signup" 
    params = {}
    print "Please enter your name: "
    params[:name] = gets.chomp
    print "Please enter your email: "
    params[:email] = gets.chomp
    print "Please enter your password: "
    params[:password] = gets.chomp
    print "Please enter confirmation password: "
    params[:password_confirmation] = gets.chomp
    response = Unirest.post("#{base_url}/users", parameters: params)
    pp response.body 
    #below makes this use logged in, instead of having the user manually log in 
    response = Unirest.post("#{base_url}/user_token", parameters: {auth: params})
  elsif user_choice == "login" 
    params = {}
    print "Enter email: "
    params[:email] = gets.chomp
    print "Enter password: "
    params[:password] = gets.chomp
    response = Unirest.post("#{base_url}/user_token", parameters: {auth: params})
    pp response.body 
    # Save the JSON web token from the response
    jwt = response.body["jwt"]
    # Include the jwt in the headers of any future web requests
    Unirest.default_header("Authorization", "Bearer #{jwt}")
  elsif user_choice == "logout"
    jwt = ""
    Unirest.clear_default_headers()
  elsif user_choice == "q"
    puts "Bye!!!!"
    break
  end 
  puts  
  puts "Press enter to continue."
  gets.chomp
end

