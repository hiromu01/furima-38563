class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :contributor_confirmation, only: [:edit, :destroy]
  before_action :order_confirmation, only: [:edit]

  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to @item
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :introduction, :category_id, :situation_id, :cost_id, :area_id, :send_day_id,
                                 :price).merge(user_id: current_user.id)
  end

  def contributor_confirmation
    redirect_to root_path unless current_user == @item.user
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def order_confirmation
    if  @item.order != nil
      redirect_to root_path
    end
  end

end
