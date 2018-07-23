class ProjectsController < ApplicationController

  def index
    @projects = policy_scope(Project)
  end

  def new
    @project = Project.new
    authorize @project
  end

  def create
    @project = Project.new(project_params)
    authorize @project
    if @project.save
      redirect_to projects_path
    else
      render :new
    end
  end

  def show
    @project = Project.find(params[:id])
    authorize @project
    @work_log = WorkLog.new
  end

  private

  def project_params
    params.require(:project).permit(:code, :client_id)
  end


end
