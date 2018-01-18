class ContactsController < ApplicationController
  # before_action :authenticate_user, except: [:index, :show]
  def index 
    contacts = Contact.all.order(:id => :asc) #current_user.contact
    if params[:first_name_search]
      contacts = contacts.where("first_name ILIKE ?", "%#{params[:first_name_search]}%")
    end
    if params[:middle_name_search]
      contacts = contacts.where("middle_name ILIKE ?", "%#{params[:middle_name_search]}%")
    end
    if params[:last_name_search]
      contacts = contacts.where("last_name ILIKE ?", "%#{params[:last_name_search]}%")
    end
    if params[:email_search]
      contacts = contacts.where("email ILIKE ?", "%#{params[:email_search]}%")
    end
    if params[:phone_number_search]
      contacts = contacts.where("phone_number ILIKE ?", "%#{params[:phone_number_search]}%")
    end
    render json: contacts.as_json
  end 
  def create
    contact = Contact.new(
      first_name:params["first_name"],
      middle_name:params["middle_name"], 
      last_name:params["last_name"], 
      email:params["email"], 
      phone_number:params["phone_number"],
      bio:params["bio"], 
      # user_id: current_user.id 
      ) 
    if contact.save
      render json: contact.as_json
    else
      render json: {errors: contact.errors.full_messages}, status: :bad_request
    end
  end
  def show
    contact = Contact.find_by(id: params["id"])
    render json: contact.as_json
  end
  def update
    contact = Contact.find_by(id: params["id"])
    contact.first_name = params["first_name"]  || contact.first_name
    contact.last_name = params["last_name"]  || contact.last_name
    contact.middle_name = params["middle_name"] || contact.middle_name 
    contact.email = params["email"]  || contact.email
    contact.phone_number = params["phone_number"]  || contact.phone_number
    contact.bio = params["bio"] || contact.bio
    if contact.save
      render json: contact.as_json
    else
      render json: {errors: contact.errors.full_messages}, status: :bad_request
    end
  end
  def destroy
    contact_id = params["id"]
    contact = Contact.find_by(id: contact_id)
    contact.destroy 
    render json: {message: "Contact has been deleted."}
  end

end
