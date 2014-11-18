class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end

  def new
    @message_info = MessageInfo.new
  end

  def create
    @message_info = MessageInfo.new message_params

    if @message_info.valid?
      @message_info.save
      flash[:success] = 'Message sent'
      redirect_to root_path
    else
      render(:new)
    end
  end

  def message_params
    params.require(:message_info).permit(MessageInfo::PUBLIC_ATTRS)
  end
end
