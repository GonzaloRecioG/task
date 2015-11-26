class TodosController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @todos = Todo.all
  end

  def show

  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      flash[:notice] = 'Your todo was created.'
      redirect_to todos_path #it goes to show you all
    else
      flash[:notice] = 'Oops something went wrong'
      render 'new'
    end
  end

  def edit
  end

  def update
    if @todo.update_attributes(todo_params)
      flash[:notice] = 'Your todo was updated'
      redirect_to todo_path #it goes to show only one
    else
      flash[:notice] = 'Oops, something went wrong'
      render 'edit' #we use render because we can not use redirect_to 2 times.
    end
  end

  def destroy
    @todo.destroy
    redirect_to root_path
  end


  private

  def todo_params
    params.require(:todo).permit(:title)
  end

  def set_task
    @todo = Todo.find(params[:id])
  end

end
