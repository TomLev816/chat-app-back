class Api::V1::RoomsController < ApplicationController
  def index
    @rooms = Room.all
    render json: @rooms
  end

  def new
    @room = Room.new
  end

  def create
    room = Room.new(room_params)
    if room.save
      serialized_data = ActiveModelSerializers::Adapter::Json.new(
        RoomSerializer.new(room)
      ).serializable_hash
      ActionCable.server.broadcast 'rooms_channel', serialized_data
      head :ok
    end
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    @room.update(room_params)
    render json: @room
  end

  private

  def room_params
    params.require(:room).permit(:url, :name, :isPrivate)
  end
end
