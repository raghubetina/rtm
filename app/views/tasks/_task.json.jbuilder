json.extract! task, :id, :user_id, :body, :complete, :created_at, :updated_at
json.url task_url(task, format: :json)
