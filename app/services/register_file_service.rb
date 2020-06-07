class RegisterFileService
  class << self
    def call(user, params, mapped_values)
      contact_file = ContactFile.new(user: user, csv_file: params[:csv_file])

      ContactFileWorker.perform_async(contact_file.id, mapped_values) if contact_file.save
    end
  end
end
