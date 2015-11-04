class Chat < ActiveRecord::Base

	belongs_to :sender , class_name: "Users"
	belongs_to :receiver , class_name: "Users"
	

	def self.show_chat (user1 , user2)

	Chat.find_by_sql ["select text,created_at from chats where sender_id= ? and receiver_id= ? OR sender_id= ? and receiver_id= ? 
						ORDER BY created_at" , user1,user2,user2,user1]
		
	end


end
