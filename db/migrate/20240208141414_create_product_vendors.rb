class CreateProductVendors < ActiveRecord::Migration[7.0]
  def change
    create_table :product_vendors do |t|
      t.string :company_code
      t.string :name
      t.text :description
      t.string :address
      t.string :city
      t.string :state
      t.string :postal_code
      t.string :country_code
      t.timestamps
    end
  end
end
