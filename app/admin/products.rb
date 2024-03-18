ActiveAdmin.register Product, as: "Products" do
  permit_params :product_name, :description, :image, :price, :created_at, :category_id, :sub_category_id
  actions :all
  config.filters = false
  
  controller do
    def get_subcategories
      category = Category.find(params[:category_id])
      subcategories = category.sub_categories.pluck(:id, :name)
      render json: subcategories
    end
  end

  index do
    id_column
    column :product_name
    column :image do |object|
      if object.image.attached?
        div do
          image_tag object.image, style: "width:80px;height:80px"
        end
      end
    end
    column :category_id do |object|
      name = Category.find_by(id: object.category_id)&.name
      name if name.present?
    end
    column :sub_category_id do |object|
      name = SubCategory.find_by(id: object&.sub_category_id)&.name
      name if name.present?
    end
    column :description
    column :price
    column :created_at
    actions
  end


  show do
    attributes_table do
      row :product_name
      row :category_id do |object|
        name = Category.find_by(id: object.category_id)&.name
        name if name.present?
      end
      row :sub_category_id do |object|
        name = SubCategory.find_by(id: object.sub_category_id)&.name
        name if name.present?
      end
      row :image do |object|
        if object.image.attached?
          div do
            image_tag object.image, style: "width:100px;height:100px"
          end
        end
      end
      row :price
      row :description
      row :created_at
    end
  end

  form do |f|
    f.inputs do
      f.input :product_name
      f.input :image, as: :file
      f.input :description
      # f.input :category_id, label: "Category", as: :select, collection: Category.all.pluck(:name, :id)
      # f.input :sub_category_id, label: "Sub Category", as: :select, collection: SubCategory.all.pluck(:name, :id)
      f.input :category_id, label: "Category", as: :select, collection: Category.all.pluck(:name, :id), input_html: { id: "category-select" }
      render partial: 'admin/sub_categories'
      f.input :sub_category_id, label: "Subcategory", as: :select, collection: [], input_html: { id: "sub-category-select", data: { "current-subcategory-id": f.object.sub_category_id } }
      f.input :price
    end
    f.actions
  end

end


