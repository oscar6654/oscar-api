class RegisteredApplicationsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @registered_applications = current_user.registered_applications.all
  end

  def new
    @registered_application = RegisteredApplication.new
  end

  def create
    @registered_application = current_user.registered_applications.build(registered_applications_params)

    if @registered_application.save
     redirect_to registered_applications_path
    else
      flash[:error] = "Error saving website - please try again."
      render :new
    end
  end

  def edit
    @registered_application = RegisteredApplication.find(params[:id])
  end

  def update
    @registered_application = RegisteredApplication.find(params[:id])
    if @registered_application.update_attributes(registered_applications_params)
     redirect_to registered_applications_path
    else
      flash[:error] = "Error saving website - please try again."
      render :new
    end
  end

  def show
  end

  private

  def registered_applications_params
    params.require(:registered_application).permit(:name, :URL)
  end
end
