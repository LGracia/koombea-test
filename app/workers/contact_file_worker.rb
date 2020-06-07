class ContactFileWorker
  include Sidekiq::Worker

  def perform(contact_file_id, mapped_values)
    BulkContactService.call(contact_file_id, mapped_values)
  end
end
