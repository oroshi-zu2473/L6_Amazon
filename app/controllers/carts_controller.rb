class CartsController < ApplicationController
    def show
        @cart_items = CartItem.where(cart_id: current_cart.id)
    end
end
