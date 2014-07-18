class ProfilesController < ApplicationController
  def show
  	@user = User.find_by_profile_name(params[:id])
  	if @user
  		@quotes = @user.quotes.order('created_at DESC').all
  	else
  		render file: 'public/404',status: 404,formats: :html
  	end
  end
end
