class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable :registerable,
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable
  has_many :project_users
  has_many :projects, through: :project_users
  has_many :work_logs, through: :project_users

  enum state: {member: 0, manager: 1}
end
