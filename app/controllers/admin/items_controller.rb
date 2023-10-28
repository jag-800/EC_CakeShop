class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!
  before_action :ensure_item, only: [:show, :edit, :update]

  def new
    @item = Item.new
    @genres = Genre.all
  end

  def index
    @items = Item.page(params[:page])
    @all_items_count = @items.count
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_item_path(@item)
    else
      render :new
    end
  end

  def show
  end

  def edit
    @genres = Genre.all
  end

  def update
    if @item.update(item_params)
      redirect_to admin_item_path(@item)
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:genre_id, :name, :introduction, :item_image, :price, :is_active)
  end

  def ensure_item
    @item = Item.find(params[:id])
  end
end
