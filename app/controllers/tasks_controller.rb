class TasksController < ApplicationController

    def index
        @tasks = Task.all
        @incomplete = 0
        @tasks.each do |t|
            if t.status == "active"
                @incomplete += 1
            end
        end
    end

    def create
        @task = Task.new(task_params)
        if @task.save
            redirect_to tasks_path
        end
    end

    def show
        @task = Task.find(params[:id])
    end

    def update
        @task = Task.find(params[:id])
        if @task.update(task_params)
            redirect_to tasks_path
        end
    end

    def destroy
        @task = Task.find(params[:id])
        @task.destroy
        redirect_to tasks_path
    end

    private
        def task_params
            params.require(:task).permit(:title, :status)
        end
end
