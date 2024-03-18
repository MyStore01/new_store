class CategoriesController < ApplicationController
	before_action :current_user
	def index
		@categories = Category.all
		if @categories.present?
			render json: {data: CategoriesSerializer.new(@categories, params: {current_user: current_user, base_url: request.base_url}), message: "Categories found successfully", status: 200, type: "succeess"}
		else
			render json: {errors: "not categories found"}, status: :unprocessable_entity
		end
	end


	def show
		@category = Category.find_by(id: params[:category_id])
		if @category.present?
			render json: {data: CategoriesSerializer.new(@category, params: {current_user: current_user, base_url: request.base_url}), message: "category found successfully", status: 200, type: "succeess"}
		else
      render json: {errors: "category not found"}, status: :unprocessable_entity
		end  
	end
end