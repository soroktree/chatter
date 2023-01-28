class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :username, uniqueness: true, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :room_messages, dependent: :destroy

  has_many :users, through: :users_in_room

  has_many :notifications, as: :recipient, dependent: :destroy

  after_create_commit { broadcast_append_to "users" }
end
