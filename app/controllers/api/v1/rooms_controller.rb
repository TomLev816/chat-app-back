class Api::V1::RoomsController < ApplicationController
  def index
    @rooms = Room.all
    render json: @rooms
  end

  def show
    @room = Room.find(params[:id])
    render json: @room
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.create(room_params)
    render json: @room, status: :created
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    @room.update(room_params)
    render json: @room
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    head :no_content
  end

  private

  def room_params
    params.permit(:url)
  end
end