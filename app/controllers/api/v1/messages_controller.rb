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
    @message = Message.create(message_params)
    render json: @message, status: :created
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
    params.permit(:messagename, :password, :room_id)
  end
end
