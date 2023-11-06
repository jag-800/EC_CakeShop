class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!
  before_action :ensure_cart_items, only: [:new, :confirm, :create]
  
  def new
    @order = Order.new
  end

  def confirm
    @order = Order.new(order_params)
    if params[:address_option] == '0'
      @order.get_shipping_informations_from(current_customer)
    elsif params[:address_option] == '1'
      @selected_address = current_customer.addresses.find(params[:address_id])
      @order.get_shipping_informations_from(@selected_address)
    elsif params[:address_option] == '2' && (@order.postal_code =~ /\A\d{7}\z/) && @order.destination? && @order.name?
      # 処理なし
    else
      flash[:error] = '情報を正しく入力して下さい。'
      render :new
    end
  end
  
  def create
  end
  
  def thanks
  end

  def index
    @orders = current_customer.orders.includes(:order_details, :items).page(params[:page]).reverse_order
  end

  def show
    @order = current_cusotmer.orders.find(params[:id])
    @order_details = @order.order.details.includes(:item)
  end
  
  private
  
  def order_params
    params.require(:order).permit(:post_code, :address, :name, :payment_method)
  end
  
  def ensure_cart_items
    @cart_items = current_customer.cart_items.includes(:item)
    redirect_to items_path unless @cart_items.first
  end
end
