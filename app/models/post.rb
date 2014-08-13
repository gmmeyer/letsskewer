class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :skewer
  has_many :comments

  validates :body, :skewer_id, :user_id, presence: true
  before_validation :sanitize_text

  def anonymous?
    self.anonymous
  end

  def anonymous=(anon)
    self.anonymous = anon
  end

  private
  def sanitize_text
    self.body = Nokogiri::HTML(self.body)
    self.body.xpath('/t').remove
    self.body = self.body.text
  end
end
