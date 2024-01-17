class CartItemsController < ApplicationController
    def new
        @cart_id = current_cart
        @cart_item = CartItem.new
        @product_id = params[:product_id]
        
        @products = Product.find(params[:product_id])
    end
    
    def create
        cart_item = CartItem.new(qty: params[:qty], product_id: params[:product_id], cart_id: params[:cart_id])
        if cart_item.save
            redirect_to carts_show_path
        else
            redirect_to new_product_path
        end
    end
    
    def destroy
        cart_item = CartItem.find(params[:id])
        cart_item.destroy
        redirect_to carts_show_path
    end
end
