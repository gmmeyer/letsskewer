class User < ActiveRecord::Base
  has_secure_password

  validates :password, length: { minimum: 6 }, allow_nil: true
  validates :username, :email, uniqueness: true
  validates :username, :token, :email, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create }

  before_validation :ensure_token

  has_many :user_posts, class_name: "Post", dependent: :destroy
  has_one :skewer, dependent: :destroy

  has_many :skewer_posts, through: :skewer, source: :skewer_posts

  def self.generate_token
    SecureRandom.urlsafe_base64(32)
  end

  def self.find_by_credentials(username, password)
    @user = User.find_by(username: username)
    return @user.authenticate(password) unless @user.nil?
    return @user
  end

  def reset_token!
    self.token = self.class.generate_token
    self.save!
  end

  def is_password?(password)
    self.authenticate(password)
  end

  private
  def ensure_token
    self.token ||= self.class.generate_token
  end

end
