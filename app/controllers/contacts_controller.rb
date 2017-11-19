class ContactsController < ApplicationController
  # def first_contact
  #   contact = Contact.first
  #   render json: contact.as_json # .as_json will display all the information. you can define all the information you want 
  # end
  # def second_contact
  #   contact = Contact.second
  #   render json: contact.as_json
  # end  
  # def third_contact 
  #   contact = Contact.third
  #   render json: contact.as_json
  # end 
  def index 
    contacts = Contact.all
    render json: contacts.as_json
  end 
  def create
    contact = Contact.new(first_name:params["first_name"], last_name:params["last_name"], email:params["email"], phone_number:params["phone_number"])
    contact.save
    render json: contact.as_json
  end
  def show
    contact_id = params["id"]
    contact = Contact.find_by(id: contact_id)
    render json: contact.as_json
  end
  def update
    contact_id = params["id"]
    contact = Contact.find_by(id: contact_id)
    contact.first_name = params["first_name"]  || contact.first_name
    contact.last_name = params["last_name"]  || contact.last_name
    contact.email = params["email"]  || contact.email
    contact.phone_number = params["phone_number"]  || contact.phone_number
    contact.save
    render json: contact.as_json
  end
  def destroy
    contact_id = params["id"]
    contact = Contact.find_by(id: contact_id)
    contact.destroy 
    render json: {message: "Contact has been deleted."}
  end

end
