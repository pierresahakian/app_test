class ObjectsToSellsController < ApplicationController
  before_action :set_objects_to_sell, only: [:show, :edit, :update, :destroy, :objects_owner]
  before_action :authenticate_user!
  before_action :objects_owner, only: [:edit, :update, :destroy]
    
    # add this method                         
    def objects_owner
     unless @objects_to_sell.user_id == current_user.id
      flash[:notice] = 'Access denied as you are not owner of this Job'
      redirect_to objects_to_sell_path
     end
    end

  respond_to :html
  
  def myindex
    @objects_to_sells = current_user.objects_to_sells
    respond_with(@objects_to_sells)
  end

  def index
    @objects_to_sells = ObjectsToSell.all
    respond_with(@objects_to_sells)
  end

  def show
    respond_with(@objects_to_sell)
  end

  def new
    @objects_to_sell = current_user.objects_to_sells.build
    respond_with(@objects_to_sell)
  end

  def edit
  end

  def create
    @objects_to_sell = current_user.objects_to_sells.build(objects_to_sell_params)
    @objects_to_sell.save
    respond_with(@objects_to_sell)
  end

  def update
    @objects_to_sell.update(objects_to_sell_params)
    respond_with(@objects_to_sell)
  end

  def destroy
    @objects_to_sell.destroy
    respond_with(@objects_to_sell)
  end

  private
    def set_objects_to_sell
      @objects_to_sell = ObjectsToSell.find(params[:id])
    end
    
  def find_objects_to_sell
      # by calling posts in this manner vs. `Post.find_by_id(params[:id])`, we
      # ensure we won't end up with a post belonging to another user
      current_user.objects_to_sell.where(:id => params[:id]).first
    end

    def objects_to_sell_params
      params.require(:objects_to_sell).permit(:name, :description, :price, :image, :remove_image, :image_cache)
    end
end
