class SubCategory < ApplicationRecord
	self.table_name = :sub_categories
	belongs_to :category
	validates :name, :category_id, presence: true
end