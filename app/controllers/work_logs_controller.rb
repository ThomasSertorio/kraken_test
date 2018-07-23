class WorkLogsController < ApplicationController

  def create
    binding.pry
    @project = Project.find(params[:project_id])
    @work_log = WorkLog.new(work_log_params)
    @work_log.project_user = current_user.project_users.where(project: @project).first
    authorize @work_log
    if @work_log.save
      redirect_to project_path(@project)
    else
      render '/projects/show'
    end
  end

  private

  def work_log_params
    params.require(:work_log).permit(:works_on, :duration)
  end



end
