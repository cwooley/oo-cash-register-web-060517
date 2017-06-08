require 'pry'
class  CashRegister
  attr_reader :discount
  attr_writer :total
  attr_reader :last_price


  @@last_items= []
  @@last_price

  def initialize(discount= 0)
    @total = 0
    @discount = discount
    @cart = []
  end

  def add_item(item, price, quantity= 1)
    quantity.times do
      @total += price
      @@last_items << item
      @cart << item
    end
    @@last_price = quantity * price
  end

  def total
    @total
  end

  def apply_discount
    if @discount != 0
      amt_off = (@discount / 100.0) * @total
      @total = @total - amt_off.to_i
      return "After the discount, the total comes to $#{@total}."
    else
      return "There is no discount to apply."
    end
  end

  def items
    @cart
  end

  def void_last_transaction
    @total -= @@last_price

    @@last_items.each do |item|
      @cart.delete(item)
    end
  end


end
