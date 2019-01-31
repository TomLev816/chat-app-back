class User < ApplicationRecord
  has_secure_password
  belongs_to :room
  has_many :messages
  validates :username, uniqueness: { case_sensitive: false }

end
