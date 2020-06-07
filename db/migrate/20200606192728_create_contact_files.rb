class CreateContactFiles < ActiveRecord::Migration[5.0]
  def change
    create_table :contact_files do |t|
      t.string :status, default: 'waiting'
      t.belongs_to :user

      t.timestamps
    end
  end
end
