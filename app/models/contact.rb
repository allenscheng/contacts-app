class Contact < ApplicationRecord

  belongs_to :user, optional: true

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, format: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  def friendly_update_at
    updated_at.strftime("%B %e, %Y")
  end
  def full_name
    full_name = ""
    full_name += first_name + " " + last_name
  end
  def jap_code
    jap_num = "+81 #{phone_number}"
  end
  def as_json
    {
      id: id,
      first_name: first_name, 
      middle_name: middle_name, 
      last_name: last_name,
      full_name: full_name,
      email: email,
      phone_number: phone_number,
      updated_at: friendly_update_at,
      jap_num: jap_code,
      bio: bio
    }
  end
end
