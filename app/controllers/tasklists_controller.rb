class TasklistsController < ApplicationController
  before_action :set_tasklist, only: [:show, :edit, :update, :destroy]
  
  def index
    @tasklists = Tasklist.all
  end

  def show
    set_tasklist
  end

  def new
    @tasklists = Tasklist.new
  end

  def create
    @tasklists = Tasklist.new(tasklist_params)
    
    if @tasklists.save
      flash[:success] = 'タスクが正常に投稿されました'
      redirect_to @tasklists
    else
      flash.now[:danger] = 'タスクが投稿されませんでした'
      render :new
    end
  end

  def edit
    set_tasklist
  end

  def update
    set_tasklist

    if Tasklist.update(tasklist_params)
      flash[:success] = 'タスクは正常に更新されました'
      redirect_to @tasklists
    else
      flash.now[:danger] = 'タスクは更新されませんでした'
      render :edit
    end
  end

  def destroy
    set_tasklist
    @tasklists.destroy

    flash[:success] = 'タスクは正常に削除されました'
    redirect_to tasklists_url
  end
end

private
  
  def set_tasklist
    @tasklists = Tasklist.find(params[:id])
  end

# Strong Parameter
def tasklist_params
  params.require(:tasklist).permit(:content)
end
