require 'date'
class TodosController < ApplicationController
  def index
    @todos = current_user.todos if current_user.present?
  end
  def new
  end
  def show
    @todo = Todo.find(params[:id])
  end
  def create
    @todo = current_user.todos.build(todo_params)
    @todo.save
    redirect_to root_path , notice: 'Your new TODO was saved'
  end
  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
    redirect_to root_path
  end

  private

  def todo_params
    params.require(:todo).permit(:description)
  end
end