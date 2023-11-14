class UsersController < ApplicationController

  def index
    @users = User.all
    @successful_imports = flash[:successful_imports]
    @unsuccessful_imports = flash[:unsuccessful_imports]
  end


  def import
    if params[:file].present?
      result = User.import(params[:file])
      @successful_imports = result[:successful_imports]
      @unsuccessful_imports = result[:unsuccessful_imports]
      flash[:notice] = 'Import completed.'
      flash[:successful_imports] = @successful_imports
      flash[:unsuccessful_imports] = @unsuccessful_imports
    end
    redirect_to users_path
  end

end
