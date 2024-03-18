class ProductsSerailzer < ActiveModel::Serializer
	attributes :id, :name, :category_id

	attributes "category name" do |object|
		name = Category.find_by(id: object.category_id)&.name
		name if name.present?
	end
end