class Products < ApplicationController
	before_action :current_user
 
  def index
		@Products = Product.all
		render json: {data: ProductsSerializer.new(@products, params: {current_user: current_user, base_url: request.base_url}), message: "product found successfilly", status: 200, type: "succeess"}
	end

	def sub_category_wise_products
		@category = Category.find_by(id: params[:category_id])
		@sub_category = SubCategory.find_by(id: params[:sub_category_id])
		products = Product.where(category_id: @category.id, sub_category_id: @sub_category.id)
		if products.present?
			render json: {data: ProductsSerializer.new(@products, params: {current_user: current_user, base_url: request.base_url}), message: "product found successfilly", status: 200, type: "succeess"}
		else
			render json: {errors: "products not found"}, status: :unproccessable_entity
		end
	end


	def show
		@product = Product.find_by(id: params[:id])
		if @product.present?
			render json: {data: ProductsSerializer.new(@product, params: {current_user: current_user, base_url: request.base_url}), message: "product found successfilly", status: 200, type: "succeess"}
		else
			render json: {errors: "product not found", status: unproccessable_entity}
		end
	end
end