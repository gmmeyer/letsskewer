class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :skewer

  validates :body, :skewer_id, :user_id, presence: true
  before_validation :sanitize_text

  private
  def sanitize_text
    self.body = Nokogiri::HTML(self.body)
    self.body.xpath('/t').remove
    self.body = self.body.text
  end
end
