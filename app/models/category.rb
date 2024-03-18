class Category < ApplicationRecord
	self.table_name = :categories
	has_many :sub_categories, class_name: "SubCategory", dependent: :destroy
	validates :name, presence: true
end