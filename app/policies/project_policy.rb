class ProjectPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.joins(:project_users).where("project_users.user_id = ?", user.id)
    end
  end

  def create?
    user.manager?
  end

  def show?
    true
  end
end
