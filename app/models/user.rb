class User < ActiveRecord::Base
  has_many :links, dependent: :destroy
  has_secure_password

  validates :username,
            :presence => true,
            length: { minimum: 3},
            uniqueness: { case_sensitive: false }
  validates :password,
            length: { minimum: 8 }

  def owns_link?(link)
    self == link.user
  end
end
