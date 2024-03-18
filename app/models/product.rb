class Product < ApplicationRecord
	self.table_name = :products
	has_one_attached :image
	validates :product_name, :price, presence: "can't be blank"
end