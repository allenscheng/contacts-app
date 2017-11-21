class ChangeBioAttributeType < ActiveRecord::Migration[5.1]
  def change
    change_column :contacts, :bio, :text
  end
end
