class ContactFilesController < ApplicationController
  before_action :authenticate_user!

  def index
    @contact_files = ContactFile.all
  end

  def new
    @contact_file = ContactFile.new
  end

  def create
    RegisterFileService.call(current_user, contact_file_params, mapped_values)
    redirect_to action: :index
  end

  private

  def contact_file_params
    params.require(:contact_file).permit(:csv_file)
  end

  def mapped_values
    {
      name: params[:name],
      birthday: params[:birthday],
      phone: params[:phone],
      address: params[:address],
      credit_card: params[:credit_card],
      email: params[:email],
    }
  end
end
