class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :events_owner, only: [:edit, :update, :destroy]

     # add this method                         
    def events_owner
     unless @event.user_id == current_user.id
      flash[:notice] = 'Access denied as you are not owner of this Job'
      redirect_to event_path
     end
    end

  respond_to :html
  
  def myindex
    @events = current_user.events
    respond_with(@events)
  end

  def index
    @events = Event.all
    respond_with(@events)
  end

  def show
    respond_with(@event)
  end

  def new
    @event = current_user.events.build
    respond_with(@event)
  end

  def edit
  end

  def create
    @event = current_user.events.build(event_params)
    @event.save
    respond_with(@event)
  end

  def update
    @event.update(event_params)
    respond_with(@event)
  end

  def destroy
    @event.destroy
    respond_with(@event)
  end

  private
    def set_event
      @event = Event.find(params[:id])
    end
    
  def find_event
      # by calling posts in this manner vs. `Post.find_by_id(params[:id])`, we
      # ensure we won't end up with a post belonging to another user
      current_user.event.where(:id => params[:id]).first
    end

    def event_params
      params.require(:event).permit(:title, :description, :start, :end, :location, :price, :image, :remove_image, :image_cache)
    end
end
