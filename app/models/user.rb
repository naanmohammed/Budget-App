class User < ApplicationRecord
  has_many :expenses, foreign_key: :author_id
  validates :name, presence: true
  # Include default devise modules. Others available are:
  #:lockable, :confirmable, :timeoutable, :trackable and :omniauthable 
  devise :database_authenticatable, :registerable, 
         :recoverable, :rememberable, :validatable
end
