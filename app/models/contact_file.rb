class ContactFile < ApplicationRecord
  belongs_to :user
  has_one_attached :csv_file

  validates :csv_file, presence: true

  enum status: {
    waiting: 'waiting',
    processing: 'processing',
    failed: 'failed',
    done: 'done'
  }
end
