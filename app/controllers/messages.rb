class Messages < Application
  provides :xml, :js, :yaml
  
  def index
    @messages = Message.find(:all)
    render @messages
  end
  
  def show
    @message = Message.find(params[:id])
    render @message
  end
  
  def new
    only_provides :html
    @message = Message.new(params[:message])
    render
  end
  
  def create
    @message = Message.new(params[:message])
    if @message.save
      redirect url(:message, @message)
    else
      render :action => :new
    end
  end
  
  def edit
    only_provides :html
    @message = Message.find(params[:id])
    render
  end
  
  def update
    @message = Message.find(params[:id])
    if @message.update_attributes(params[:message])
      redirect url(:message, @message)
    else
      raise BadRequest
    end
  end
  
  def destroy
    @message = Message.find(params[:id])
    if @message.destroy
      redirect url(:messages)
    else
      raise BadRequest
    end
  end
end