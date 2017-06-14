class TasklistsController < ApplicationController
  def index
    @tasklists = Tasklist.all
  end

  def show
    @tasklists = Tasklist.find(params[:id])
  end

  def new
    @tasklists = Tasklist.new
  end

  def create
    @tasklists = Tasklist.new(tasklist_params)
    
    if @tasklist.save
      flash[:success] = 'タスクが正常に投稿されました'
      redirect_to @tasklists
    else
      flash.now[:danger] = 'タスクが投稿されませんでした'
      render :new
    end
  end

  def edit
    @tasklists = Tasklist.find(params[:id])
  end

  def update
    @tasklists = Tasklist.find(params[:id])

    if tasklists.update(tasklist_params)
      flash[:success] = 'タスクは正常に更新されました'
      redirect_to @tasklists
    else
      flash.now[:danger] = 'タスクは更新されませんでした'
      render :edit
    end
  end

  def destroy
    @tasklists = Tasklist.find(params[:id])
    @tasklists.destroy

    flash[:success] = 'タスクは正常に削除されました'
    redirect_to tasklists_url
  end
end

# Strong Parameter
def tasklist_params
  params.require(:tasklist).permit(:content)
end
