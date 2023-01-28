class RoomsController < ApplicationController
  def index
    @rooms = Room.all
    @room = Room.new
    @users = User.all
  end

  def create 
    @room = Room.create(name: params["room"]["name"])
  end

  def show
    @rooms = Room.all
    @users = User.all
    @room = Room.find(params[:id]) if params[:id]
    @current_user = current_user
    @current_room = Room.find(params[:id]) 
    @room_message = RoomMessage.new room: @room
    @room_messages = @room.room_messages.includes(:user)
  end 

  private

  def set_rooms_and_users 

  end
end
