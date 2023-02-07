class CashRegister
  attr_accessor :total, :discount, :previous_total, :cart

  def initialize (discount = 0)
    @discount =discount
    @cart = []
    @total = 0
  end

  def add_item(title, price, quantity = 1)
    self.previous_total = price * quantity
    self.total += self.previous_total
    quantity.times do
      self.cart << title
    end
  end

  def apply_discount
    if self.discount != 0
      discount_as_percent = (100.0 - self.discount.to_f) / 100
      self.total = (self.total * discount_as_percent).to_i
      "After the discount, the total comes to $#{self.total}."
    else
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    self.total -= self.previous_total
  end

  def items
    cart
  end
end