class Friendship < ActiveRecord::Base

	belongs_to :sender , class_name: "User"
	belongs_to :receiver , class_name: "User"


	def self.select_friends (user1)

		Friendship.find_by_sql ["select * from friendships where sender_id= ? or receiver_id= ? " , user1,user1 ]
		
	end


end
