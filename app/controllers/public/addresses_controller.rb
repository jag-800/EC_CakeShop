class Public::AddressesController < ApplicationController
  before_action :authenticate_customer!
  before_action :ensure_address, only: [:edit, :update, :destroy]
  
  def index
    @addresses = current_customer.addresses
    @address = Address.new
  end

  def create
    @addresses = current_customer.addresses
    # @address = @addresses.new(address_params)
    # こう書くと、save出来なかった時に、@addressesの最後に空レコードが入り、エラーになる。
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    if @address.save
      redirect_to addresses_path
    else 
      render :index
    end
  end
  
  def edit
  end
  
  def update
    if @address.update(address_params)
      redirect_to addresses_path
    else
      render :edit
    end
  end
  
  def destroy
  end
  
  private
  
  def address_params
    params.require(:address).permit(:post_code, :address, :name)
  end
  
  def ensure_address
    @addresses = current_customer.addresses
    @address = @addresses.find_by(id: params[:id])
    redirect_to addresses_path unless @address
  end
end
