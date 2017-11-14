class User < ActiveRecord::Base
  validates :username, :password_digest,  :presence => true
end
