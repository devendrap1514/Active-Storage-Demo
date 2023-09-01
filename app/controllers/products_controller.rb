class ProductsController < ApplicationController
  protect_from_forgery

  def index
    render json: Product.all
  end

  def create
    product = Product.new(product_params)
    if product.save
      render json: product
    else
      render json: { errors: product.errors.full_messages }
    end
  end

  private
    def product_params
      params.require(:product).permit(images:[])
    end
end
