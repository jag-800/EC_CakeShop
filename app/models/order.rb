class Order < ApplicationRecord
  
  belongs_to :customer
  has_many :order_details
  
  validates :post_code, presence: true, format: { with: /\A\d{7}\z/ }
  validates :address, presence: true
  validates :name, presence: true
  validates :shipping_cost, presence: true, :numericality => { :greater_than_or_equal_to => 0 }
  validates :total_payment, presence: true, :numericality => { :greater_than_or_equal_to => 0 }
  
end
