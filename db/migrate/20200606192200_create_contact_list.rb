class CreateContactList < ActiveRecord::Migration[5.0]
  def change
    create_table :contact_lists do |t|
      t.belongs_to :user
      t.belongs_to :contact

      t.timestamps
    end
  end
end
