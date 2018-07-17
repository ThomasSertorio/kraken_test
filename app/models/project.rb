class Project < ApplicationRecord
  belongs_to :client
  has_many :project_users
  has_many :users, through: :project_users
end
