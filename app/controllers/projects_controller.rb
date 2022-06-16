class ProjectsController < ApplicationController
  protect_from_forgery :except => :create 
  def index
    rent = Stage.all
    render :json => rent.to_json(:include => :tasks)
  end

  def create
    @stage = Stage.new({title: params.require(:title)})
    @stage.save
  end

  def update
    active_task = Task.find(params[:id])
    active_task.update(isCompleted: !params[:isCompleted])
  end
end
