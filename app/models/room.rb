class Room < ApplicationRecord
    validates_uniqueness_of :name

    after_create_commit { broadcast_append_to "rooms" }
    
    has_many :room_messages, dependent: :destroy, inverse_of: :room
    has_many :users, through: :users_in_room
end
