require 'pry'
class CashRegister
    attr_accessor :total, :items, :last_transaction
    attr_reader :discount

    def initialize(discount=0.00)
        @total = 0.00
        @discount = discount
        @items = []
        @last_transaction = 0
    end

    def add_item(title, price, quantity=1)
        @last_transaction = price * quantity
        @total += @last_transaction
        quantity.times{@items << title}
    end

    def apply_discount
        if @discount != 0.00
            @total -= @discount/100.0 * @total
            return "After the discount, the total comes to $#{@total.to_i}."
        else
            return "There is no discount to apply."
        end
    end

    def void_last_transaction
        @total -= @last_transaction
    end
end

cash = CashRegister.new(10)
# binding.pry