require "unirest"
system "clear"

require "pp" #to print on it's own line 

puts "Choose an option"
puts "1 - to view all contacts." 
puts "2 - to create a new contact."
puts "3 - to view a single contact."
puts "4 - to update a contact information."
puts "5 - to delete a contact." 

user = gets.chomp 

if user == "1"
  response = Unirest.get("http://localhost:3000/contact")
  contact = response.body  
  pp contact 
elsif user == "2"
  params = {}
  print "Please enter the contacts first name: "
  params["first_name"] = gets.chomp
  print "Please enter the contacts last name: "
  params["last_name"] = gets.chomp
  print "Please enter the contacts email: "
  params["email"] = gets.chomp
  print "Please enter the contacts phone number (format xxx-xxx-xxxxx): "
  params["phone_number"] = gets.chomp
  response = Unirest.post("http://localhost:3000/contact", parameters: params)
  contact = response.body
  pp contact
elsif user == "3"
  print "Enter the contact id to be seen: "
  contact_id = gets.chomp
  response = Unirest.get("http://localhost:3000/contact/#{contact_id}")
  contact = response.body
  pp contact 
elsif user == "4"
  print "Enter the contact id that needs to be updated: " 
  params = {}
  contact_id = gets.chomp
  response = Unirest.get("http://localhost:3000/contact/#{contact_id}")
  contact = response.body
  print "Enter the new first name(#{contact["first_name"]}): "
  params["first_name"] = gets.chomp
  print "Enter the new last name(#{contact["last_name"]}): "
  params["last_name"] = gets.chomp
  print "Enter the new email(#{contact["email"]}): "
  params["email"] = gets.chomp
  print "Enter the new phone number(#{contact["phone_number"]}): "
  params["phone_number"] = gets.chomp
  response = Unirest.patch("http://localhost:3000/contact/#{contact_id}", parameters: params)
  contact = response.body 
  pp contact 
elsif user == "5"
  print "Enter the contact to delete: "
  contact_id = gets.chomp 
  response = Unirest.delete("http://localhost:3000/contact/#{contact_id}")
  pp contact = response.body
end 
