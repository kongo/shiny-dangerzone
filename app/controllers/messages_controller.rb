class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new message_params
    render(:new) && return unless @message.valid?

    @message.write_to_file_storage
    flash[:success] = 'Message sent'
    redirect_to root_path
  end

  def message_params
    params.require(:message).permit(Message::PUBLIC_ATTRS)
  end
end
