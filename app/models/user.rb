class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts

  validates :username, presence: true, uniqueness: { case_sensitive: true }
  validates :email, presence: true
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
end
