class StaticPagesController < ApplicationController

	before_action :user_signed_in?


	def index
		
	end


	def home

		@users=User.select_users(current_user)  # This query in database will select only those users
								   # who are not yet a friend of the current user . 
								   # Friends with the current user won't be displayed here 
								   # according to this query.

	end

	

	

	def destroy

		User.find(params[:id]).destroy
		
		redirect_to @users
		
	end

end
