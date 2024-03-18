ActiveAdmin.register SubCategory,  as: "Sub Categories" do
  permit_params :name, :category_id, :created_at
  config.filters = false
  actions :all
  index do
    id_column
    column :name
    column :category_id do |object|
      name = Category.find_by(id: object.category_id)&.name
      name if name.present?
    end
    column :created_at
    actions
  end
  
  show do
    attributes_table do
      row :name
      row :category_id do |object|
        name = Category.find_by(id: object.category_id)&.name
        name if name.present?
      end
      row :created_at
    end
  end


  form do |f|
    f.inputs do
      f.input :name
      f.input :category_id, label: "Category", as: :select, collection: Category.all.pluck(:name, :id)
    end
    f.actions
  end
end
