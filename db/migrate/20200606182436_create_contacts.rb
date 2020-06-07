class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.string :name
      t.date :birthday
      t.string :phone
      t.string :address
      t.string :credit_card
      t.string :email
      t.string :franchise

      t.timestamps
    end
    add_index :contacts, :email
  end
end
