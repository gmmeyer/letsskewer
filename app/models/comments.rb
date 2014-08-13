class Comments < ActiveRecord::Base
  belongs_to :post
  belongs_to :comment
  has_many :comments

  validates :post_id

end
