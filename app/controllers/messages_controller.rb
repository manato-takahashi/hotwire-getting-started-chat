class MessagesController < ApplicationController
  before_action :set_message, only: %i(edit update destroy)

  def index
    @messages = Message.order(:id)
  end

  def new
    @message = Message.new
  end

  def create
    if Entry.where(user_id: current_user.id, room_id: params[:message][:room_id]).present?
      @message = Message.new(message_params)
      if @message.save
        flash.now[:notice] = '作成しました'
        redirect_to "/rooms/#{@message.room_id}"
      else
        redirect_back(fallback_location: root_path)
      end
    end
  end

  def edit
  end

  def update
    if @message.update(message_params)
      flash.now[:notice] = '更新しました'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @message.destroy!
    flash.now[:alert] = '削除しました'
  end

  private

  def message_params
    params.require(:message).permit(:user_id, :content, :room_id).merge(user_id: current_user.id)
  end

  def set_message
    @message = Message.find(params[:id])
  end
end
