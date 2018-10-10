json.extract! objects_to_sell, :id, :name, :description, :price, :image, :created_at, :updated_at
json.url objects_to_sell_url(objects_to_sell, format: :json)
