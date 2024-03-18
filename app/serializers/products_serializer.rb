class ProductsSerailzer < ActiveModel::Serializer
	attributes :id, :product_name, :description

	attributes "category name" do |object|
		name = Category.find_by(id: object&.category_id)&.name
	end

	attributes "Sub Category name" do |object|
		name = SubCategory.find_by(id: object&.sub_category_id)&.name
	end

	attributes "product image" do |object|
		if object.image.attached?
			
		end
end