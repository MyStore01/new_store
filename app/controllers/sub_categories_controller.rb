class SubCategoriesController < ApplicationController
  before_action :current_user
	def index
    @sub_cateogries = SubCategory.all
    if @sub_cateogries.present?
    	render json: {data: SubCategoriesSerializer.new(@sub_categories, params: {current_user: current_user, base_url: request.base_url}), message: "Categories found successfully", status: 200, type: "succeess"}

    else
    	render json: {errors: "no SubCategory found"}, status: :unprocessable_entity
    end
	end

	def show
		@sub_category = SubCategory.find_by(id: params[:sub_category_id])
		if @SubCategory.present?
			render json: {data: SubCategoriesSerializer.new(@sub_category, params: {current_user: current_user, base_url: request.base_url}), message: "Categories found successfully", status: 200, type: "succeess"}
	end

	def category_wise_sub_categories
		@category = Category.find_by(id: params[:category_id])
		if @category.present?
			@sub_cateogries = SubCategory.where(category_id: @category.id)
			if @sub_cateogries.present?
				render json: {data: SubCategoriesSerializer.new(@sub_categories, params: {current_user: current_user, base_url: request.base_url}), message: "Categories found successfully", status: 200, type: "succeess"}
			else
				render json: {errors: "not sub categories found"}, status: :unprocessable_entity
			end
		else
			return render json: {errors: "category not present"}, status: :unprocessable_entity
		end
	end
end