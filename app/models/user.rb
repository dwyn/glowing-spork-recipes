class User < ApplicationRecord
  extend ActiveModel::Naming
  validates :name, presence: true, uniqueness: true
  validates_uniqueness_of :email, case_sensitive: false
  validates :email, presence: true, email: true
  validates :password, length: { minimum: 9 }
  has_secure_password

  def self.authenticate(email, password)
    user = User.find_by(email: email)
    user && user.authenticate(password)
  end

  def self.find_or_create_by_omniauth(auth_hash)
    self.where(email: auth_hash["info"]["email"]).first_or_create do |user|
      user.password = SecureRandom.hex 
    end
  end
end