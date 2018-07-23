class WorkLogPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def create?
    record.project_user && record.project_user.user == user
  end

  def show?
    true
  end
end
