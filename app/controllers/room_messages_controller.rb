class RoomMessagesController < ApplicationController

    def create
        @room = Room.find params.dig(:room_message, :room_id)
        @room_message = RoomMessage.create user: current_user,
                                           room: @room,
                                           message: params.dig(:room_message, :message)
    end
end
