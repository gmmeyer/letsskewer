class Skewer < ActiveRecord::Base
  belongs_to :user

  has_many :posts

  def name
    self.user.username + "'s Skewer"
  end

  def top_posts
  end

end
