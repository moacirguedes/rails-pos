json.extract! profile, :id, :name, :is_admin, :age, :user_id, :created_at, :updated_at
json.url profile_url(profile, format: :json)
