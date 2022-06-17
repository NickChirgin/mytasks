class ProjectsController < ApplicationController
  protect_from_forgery :except => :create 
  def index
    rent = Stage.all
    render :json => rent.to_json(:include => :tasks)
  end

  def create
    if Stage.where(title: params[:title]).exists?
      current_category = Stage.find(params[:title])
      new_task = Task.new({stage_id: current_category[:id], text: params[:text], isCompleted: false})
      new_task.save
    else
      @stage = Stage.new({title: params.require(:title)})
      @stage.save
      new_task = Task.new({stage_id: @stage[:id], text: params[:text], isCompleted: false})
      new_task.save
    end
  end

  def update
    active_task = Task.find(params[:id])
    active_task.update({isCompleted: !active_task[:isCompleted]})
  end
end
