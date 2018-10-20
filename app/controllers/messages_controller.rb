class MessagesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_message, only: [:show,:edit,:update,:destroy]

  def create
    @message = current_user.messages.build(message_params)
      if @message.save
        redirect_to root_path
      else
        render 'new'
    end
  end

def update
  if @message.update(message_params)
    redirect_to message_path
  else
    render 'edit'
  end
end

def destroy
  @message.destroy
  redirect_to root_path
end

def index
  @messages = Message.all.order('created_at DESC')
end

def new
  @message = current_user.messages.build
end

  def show
  end

  def edit
  end


private

def message_params
    params.require(:message).permit(:title,:description)
  end

def find_message
    @messsage = Message.find(params[:id])
end

end
