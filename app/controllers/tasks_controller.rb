class TasksController < ApplicationController
 before_action :set_task, only: [:show, :edit, :update, :destroy]
 
  #タスク一覧取得画面
  def index
    @tasks = Task.all
  end

  #タスク詳細取得画面
  def show
  end

  #タスク作成画面
  def new
     @task = Task.new
  end

  #タスク作成
  def create
    @task = Task.new(task_params)

    if @task.save
      flash[:success] = 'タスク が正常に作成されました'
      redirect_to @task
    else
      flash.now[:danger] = 'タスク が作成されませんでした'
      render :new
    end
  end

  #タスク編集画面
  def edit
  end

  #タスク編集
  def update

    if @task.update(task_params)
      flash[:success] = 'タスク は正常に更新されました'
      redirect_to @task
    else
      flash.now[:danger] = 'タスク は更新されませんでした'
      render :edit
    end
  end
  
  #タスク削除
  def destroy
    @task.destroy

    flash[:success] = 'タスク は正常に削除されました'
    redirect_to tasks_url
  end
  
  private

  def set_task
    @task = Task.find(params[:id])
  end
  # Strong Parameter
  def task_params
    params.require(:task).permit(:content, :status)
  end
end
