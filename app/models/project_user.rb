class ProjectUser < ApplicationRecord
  belongs_to :user
  belongs_to :project
  has_many :work_logs
end
