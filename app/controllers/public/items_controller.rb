class Public::ItemsController < ApplicationController

  def index
    @items = Item.page(params[:page])
    @all_items_count = @items.count
    @genres = Genre.all
  end

  def show
    @item = Item.find(params[:id])
    @genres = Genre.all
    @cart_item = CartItem.new
  end
end
