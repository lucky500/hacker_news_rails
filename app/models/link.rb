class Link < ActiveRecord::Base
  belongs_to :user

  validates :title,
            presence: true,
            uniqueness: { case_sensitive: false}

  validates :url,
  format: { with: %r{\Ahttps?://} },
            allow_blank: true
end
