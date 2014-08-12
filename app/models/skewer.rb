class Skewer < ActiveRecord::Base
  belongs_to :user

  has_many :skewer_posts, dependent: :destroy

  def name
    self.user.username + "'s Skewer"
  end

  def top_posts
  end

end
