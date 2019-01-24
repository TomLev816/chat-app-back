class Api::V1::MessagesController < ApplicationController
  def index
    @messages = Message.all
    render json: @messages
  end

  def show
    @message = Message.find(params[:id])
    render json: @message
  end

  def new
    @message = Message.new
  end

  def create
    message = Message.new(message_params)
    room = Room.find(message_params[:room_id])
    if message.save
      serialized_data = ActiveModelSerializers::Adapter::Json.new(
        MessageSerializer.new(message)
      ).serializable_hash
      MessagesChannel.broadcast_to room, serialized_data
      render json: message, status: :created
    end
  end

  def edit
    @message = Message.find(params[:id])
  end

  def update
    @message = Message.find(params[:id])
    @message.update(message_params)
    render json: @message
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    head :no_content
  end

  private

  def message_params
    params.require(:message).permit(:text, :user_id, :room_id)
  end
end
