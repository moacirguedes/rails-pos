json.extract! purchase, :id, :description, :was_bought, :profile_id, :created_at, :updated_at
json.url purchase_url(purchase, format: :json)
