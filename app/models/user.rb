class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :profile_name
  # attr_accessible :title, :body
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :profile_name, presence: true, uniqueness: true, format: {with:/^[\S]+$/, messege: "Must be in specified format"}

  has_many :quotes

  def full_name
  	"#{first_name.capitalize} #{last_name.capitalize}"
  end

  def gravatar_url
    formatted_email = email.strip.downcase
    hash = Digest::MD5.hexdigest(formatted_email)
    "http://www.gravatar.com/avatar/#{hash}"
  end
end
