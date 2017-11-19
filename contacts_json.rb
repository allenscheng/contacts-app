require "unirest"
system "clear"

response = Unirest.get("http://localhost:3000/first_contact_url.json")
p first_contact = response.body

response = Unirest.get("http://localhost:3000/second_contact_url.json")
p second_contact = response.body

response = Unirest.get("http://localhost:3000/third_contact_url.json")
p third_contact = response.body

response = Unirest.get("http://localhost:3000/all_contact_url.json")
p all_contact = response.body