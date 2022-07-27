class SchedulesController < ApplicationController
  def index
    @schedules = Schedule.all
  end

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(params.require(:schedule).permit(:title, :start_date, :end_date, :whole_day, :memo))
    if @schedule.save
      flash[:notice] = "スケジュールを新規登録しました。"
      redirect_to schedules_path
    else
      render "new"
    end
  end

  def show
    @schedule = Schedule.find(params[:id])
  end

  def edit
    @schedule = Schedule.find(params[:id])
  end

  def update
    @schedule = Schedule.find(params[:id])
    if @schedule.update(params.require(:schedule).permit(:title, :start_date, :end_date, :whole_day, :memo))
      flash[:notice] = "スケジュールIDが「#{@schedule.id}」の情報を更新しました。"
      redirect_to schedules_path
    else
      render "edit"
    end
  end

  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy
    flash[:notice] = "スケジュールを削除しました。"
    redirect_to schedules_path
  end
end
