class CashRegister
    attr_accessor :total, :discount
    attr_reader :items

    def initialize(discount=0)
        @total = 0
        @discount = discount
        @items = []
        @itemPrices = []
    end

    def add_item(title, price, quantity=1)
        @total += price * quantity
        itemObj = { "#{title}": price }
        @itemPrices << price * quantity
        quantity.times { @items << title }
    end

    def apply_discount
        if discount > 0
            @total = ((100 - discount) * 0.01 * total).to_i
            "After the discount, the total comes to $#{total}."
        else
            "There is no discount to apply."
        end
    end

    def void_last_transaction
        @itemPrices.pop
        if @itemPrices.empty?
            @total = 0
        else
            @total = @itemPrices.sum { |price| price }
        end
    end
        
end
