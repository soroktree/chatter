class RoomMessage < ApplicationRecord
  belongs_to :room, inverse_of: :room_messages
  belongs_to :user
  after_create_commit do
    notify_recipients
    broadcast_append_to "room_messages" 
  end

  private 

  def notify_recipients
    # users_in_room
  end
end
