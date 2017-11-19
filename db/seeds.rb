# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# => the .create is just a shortcut for Contact.new and contact.save

# => make to kill the server then use rails db:drop to remove everything in the database
# => 
contact = Contact.new(first_name: "Mike", last_name: "Lakes", email: "MikeLakes@gmail.com", phone_number: "123-453-8488")
contact.save

contact = Contact.new(first_name: "Jill", last_name: "Larks", email: "JillLarks@gmail.com", phone_number: "343-434-3456")
contact.save