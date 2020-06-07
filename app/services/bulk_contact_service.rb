require 'csv'

class BulkContactService
  class << self
    def call(contact_file_id, mapped_values)
      contact_file = ContactFile.find(contact_file_id)
      user = contact_file.user
      contact_file.processing!

      path = contact_file_path(contact_file.csv_file.blob.key)

      CSV.foreach(path, headers: true) do |row|
        Date.iso8601(row[mapped_values['birthday']])

        contact = Contact.new.tap do |c|
          c.name = row[mapped_values['name']]
          c.birthday = row[mapped_values['birthday']]
          c.phone = row[mapped_values['phone']]
          c.address = row[mapped_values['address']]
          c.credit_card = row[mapped_values['credit_card']]
          c.email = row[mapped_values['email']]
          c.franchise = CreditCardService.call(row[mapped_values['credit_card']])
        end

        raise StandardError('A very specific bad thing happened') unless contact.valid?

        user.contacts << contact
      end

      contact_file.done! if user.save
    rescue Exception, ArgumentError => e
      contact_file.failed!
    end

    private

    def contact_file_path(key)
      active_storage_disk_service = ActiveStorage::Service::DiskService.new(root: Rails.root.to_s + '/storage/')
      
      active_storage_disk_service.send(:path_for, key)
    end
  end
end
