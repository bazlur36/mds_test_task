class UsersController < ApplicationController

  def index
    @records = []
  end


  def import
    if params[:file].present?
      result = User.import(params[:file])
      @successful_imports = result[:successful_imports]
      @unsuccessful_imports = result[:unsuccessful_imports]
      @records = result[:records]
      flash[:notice] = 'Import completed.'
      flash[:successful_imports] = @successful_imports
      flash[:unsuccessful_imports] = @unsuccessful_imports
    end
    render :index
  end

end
