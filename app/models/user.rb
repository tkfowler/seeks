class User < ApplicationRecord
  has_secure_password
  has_many :secrets
  has_many :likes, dependent: :destroy
  has_many :secrets_liked, through: :likes, source: :secret
  email_regex = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :name, :email, presence: true
  validates :email, uniqueness: {case_sensitive: false}, format: { with: email_regex }
  validates :password, presence:true, confirmation: true, on: :create

end
