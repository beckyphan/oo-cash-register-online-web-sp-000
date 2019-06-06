require 'pry'

class CashRegister
  attr_accessor :total, :discount, :cart
  
  def initialize(discount = nil)
    @total = 0 
    @discount = discount
    @cart = []
    @itemized_list = []
  end 

  
  def total
  # @cart = [[title, price, qty], [title1, price1, qty1]
    if @cart.size == 0 
      nil
    else
      @cart.each do |item|
        if item.size == 2 
          @total += (item[1] * 1.0)
        elsif item.size == 3
          @total += (item[1] * item[2])
        end
      end
    end
    @total
  end 
  
  
  def add_item(title, price, qty = nil)
    qty == nil ? @cart << [title, price.to_f] : @cart << [title, price.to_f, qty]
  end


  def apply_discount
    if self.discount == nil
      "There is no discount to apply."
    else 
      subtotal = @total
      discounted = @discount.to_f / 100 * subtotal
      grand_total = subtotal - discounted
      @total = grand_total
      "After the discount, the total comes to $#{grand_total}."
    end
  end
  
  
  def items 
    @cart.each do |item|
      if item.length == 2 
        @itemized_list << item[0] 
      elsif item.length == 3 
        counter = item[2]
        while counter > 0
          @itemized_list << item[0]
          counter -= 1
        end
      end
    end 
    @itemized_list
  end 

  
  def void_last_transaction
    @cart.pop
    self.total
  end
  
end