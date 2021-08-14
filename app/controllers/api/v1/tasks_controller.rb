class Api::V1::TasksController < Api::V1::GraphitiController
  def index
    tasks = TaskResource.all(params)
    respond_with(tasks)
  end

  def show
    task = TaskResource.find(params)
    respond_with(task)
  end

  def create
    task = TaskResource.build(params)

    if task.save
      render jsonapi: task, status: :created
    else
      render jsonapi_errors: task
    end
  end

  def update
    task = TaskResource.find(params)

    if task.update_attributes
      render jsonapi: task
    else
      render jsonapi_errors: task
    end
  end

  def destroy
    task = TaskResource.find(params)

    if task.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: task
    end
  end
end
