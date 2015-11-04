class Invitation < ActiveRecord::Base


	belongs_to :sender , class_name: "User"
	belongs_to :receiver , class_name: "User"


	def new_token

		SecureRandom.urlsafe_base64
		
	end


	

end
