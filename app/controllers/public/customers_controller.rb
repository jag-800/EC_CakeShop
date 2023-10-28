class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
  before_action :set_current_cusotmer
  
  def show
  end

  def edit
  end

  def unsubscribe
    if @customer.update(customer_params)
      redirect_to mypage_path, notice: '会員情報の更新が完了しました。'
    else
      render :edit
    end
  end
  
  def withdraw
    @customer.update(is_active: false)
    reset_session
    redirect_to root_path
  end
  
  private
  
  def set_current_customer
    @customer = current_customer
  end
  
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :post_code, :address, :phone_number)
  end
end
