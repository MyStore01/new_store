ActiveAdmin.register Category, as: "Categories" do
  permit_params :name, :created_at
  config.filters = false
  actions :all
  
  index do
    id_column
    column :name
    column :created_at
    actions
  end
  
  show do
    attributes_table do
      row :name
      row :created_at
    end
  end


  form do |f|
    f.inputs do
      f.input :name
    end
    f.actions
  end
end