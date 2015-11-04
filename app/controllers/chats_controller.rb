class ChatsController < ApplicationController


	def show_messages

		# here we have used 2 ways of displaying all the texts of 2 persons chatting . 
		# First is by taking the results of sender and receiver separetly in different variables and 
		# then concatenating both in the result variable by sorting it according to the created_at time.

		# @ms = current_user.sent_messages.where(receiver_id: params[:idr]).order('created_at DESC')
		# @mr = current_user.received_messages.where(sender_id: params[:idr]).order('created_at DESC')
		# @result = (@ms + @mr).sort_by{ |c| c.created_at }

		# # Second is , by directly applying the Raw Sql query in the model and retrieving the the result in 
		# an instance variable and then just loop through that variable to display the messages.
		# Here we will use the 2nd method as it's more economical to directly apply the raw sql query
		# rather then creating 3 instance variable and then sorting them , this approach takes more 
		# time in larger databases while retreiving the records.

		@result = Chat.show_chat(current_user.id , params[:idr])

 		@m = Chat.new

		respond_to do |format|
		    
		    format.html 
		    format.js
		  end

	end


	def create

		if params[:chat][:sender_id].to_i != current_user.id  		# The below code is for the scenario when the user2 has invited user1 and in the frienship
																	# database the entry is like 10 , 9 . Now when 9 sends the message the link on send message take the 
																	# sender and receiver ids from frienships table where in out case the entry is 10 ,9 . And therefore
																	# the entry in the chat table will be created wrong as 10 , 9 while it should be 9,10. So , here we 
																	# have checked whether the sender id in params hash is the current user or not . If not , we have 
																	# changed it by assigning the correct interchanged value of id in idr.	

				params[:chat][:receiver_id] = params[:chat][:sender_id]

		end


		@msg=Chat.new

		@msg.sender_id = current_user.id
		@msg.receiver_id = params[:chat][:receiver_id]
		@msg.text = params[:chat][:text]

		if @msg.save

			puts "chat entry created succesfulllyy"

		end
		@m = Chat.new
		@result = Chat.show_chat(current_user.id , params[:chat][:receiver_id])
		respond_to do |format|
		    
		    format.html	# here you can also use redirect_to request.referrer }
		    format.js
		 end
		
		
	end

	def chat

			@fr=Friendship.select_friends(current_user)


			
	end



end
