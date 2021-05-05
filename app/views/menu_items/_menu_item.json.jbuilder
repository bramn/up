json.extract! menu_item, :id, :name, :icon, :page_id, :order, :created_at, :updated_at
json.url menu_item_url(menu_item, format: :json)
