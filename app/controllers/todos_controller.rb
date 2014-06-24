require 'date'
class TodosController < ApplicationController
  def index
    @todos = current_user.todos if current_user.present?
    @todo = Todo.new
  end
  def new
    @todo = Todo.new
  end
  def create
    @todo = current_user.todos.build(todo_params)
    @todos = current_user.todos if current_user.present?
    if @todo.save
       redirect_to root_path
    else
      flash[:error] = "Errors in Todo - #{@todo.errors.full_messages}"
      redirect_to root_path
    end
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