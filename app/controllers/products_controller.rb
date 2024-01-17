class ProductsController < ApplicationController
  def index
    @products = Product.all
  end
  
  def new
    
  end
  
  def create
    if Product.exists?(name: params[:name])
      flash[:alert] = '※その商品は登録されてるヨ！'
      redirect_to new_product_path
    else
      product = Product.new(name: params[:name], price: params[:price])
      if product.save
        redirect_to products_path
      else
        render 'new'
      end
    end
  end
  
  def destroy
    product = Product.find(params[:id])
    product.destroy
    redirect_to products_path
  end
end
