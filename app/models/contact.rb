class Contact < ApplicationRecord
  has_many :contact_list
  has_many :users, through: :contact_list

  validates :name, :birthday, :email, :phone, :address, :credit_card, :franchise, presence: true
  validates :credit_card, length: { in: 8..19 }
  validates :phone, format: { with: /[(](.+\d{2})[)]\s\d{3}(\s|-)\d{3}(\s|-)\d{2}(\s|-)\d{2}/,
                              message: 'Invalid format.' }
  validates_format_of :email, with: Devise::email_regexp
end
