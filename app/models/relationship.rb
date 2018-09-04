class Relationship < ApplicationRecord
  belongs_to :user
  belongs_to :follower, class_name: "User"

  def self.save_follow(id)
    self.create(follower_id: id, user_id: id)
  end
  
end
