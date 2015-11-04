class User < ActiveRecord::Base


	has_many :invitations 

	has_many :sent_messages , class_name: "Chat" , foreign_key: "sender_id" , dependent: :destroy
	has_many :received_messages , class_name: "Chat" , foreign_key: "receiver_id" , dependent: :destroy

	# Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


         def self.select_users(user1)

         	User.find_by_sql ["select * from users where id  not IN  (select sender_id from friendships where receiver_id = ? UNION 
                              select receiver_id from friendships where sender_id = ? )", user1 , user1]
         	
         end




end

