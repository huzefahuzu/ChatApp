class InvitationController < ApplicationController


	def insert

		
		if Friendship.exists?(:sender_id => params[:id] , :receiver_id => params[:idr])


				puts "You are already friend with this user ......"

				flash[:notice] = "YYou are already friend with this user"


		elsif Friendship.exists?(:sender_id => params[:idr] , :receiver_id => params[:id])


				puts "Youuu are alsooo connncected with your friend ..... !!!!!!!!!!!!!!"
					
				flash[:notice] = "YYou are already friend with this user"

		else

				@user=Invitation.new

				@user.sender_id = params[:id]

				@user.receiver_id = params[:idr]

				@user.token = SecureRandom.urlsafe_base64

				if @user.sender_id == @user.receiver_id 

					puts "You can't add yourself"

					 flash[:notice] = "You can't add yourself"

				else

						if  @user.save

						#	@user = User.find(@user.receiver) # We have altered the user variable by getting the id of receiver's 
															  # from the User table so that we can retrieve it's email in the mailer's view directly.

							UserMailer.account_invitation(@user).deliver_now

							puts "mail sent successfully........"

							flash[:success] = "mail sent successfully	"
											 	
						end

				end

			
		end


		redirect_to users_path
		
	end



	def edit

	#	inv = Invitation.find_by(receiver: params[:receiver]).where(token: params[:id])

		inv = Invitation.find_by(token: params[:id])

	
		if inv

			puts "the token matched in the database ...... "
	
		end


		fr = Friendship.new

		fr.sender_id = inv.sender_id
		fr.receiver_id = inv.receiver_id

		if fr.save

			puts "values added in the friendship table......"
			
		end

		

		redirect_to users_path
		
	end



end
