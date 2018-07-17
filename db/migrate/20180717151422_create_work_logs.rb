class CreateWorkLogs < ActiveRecord::Migration[5.1]
  def change
    create_table :work_logs do |t|
      t.references :project_user, foreign_key: true
      t.date :works_on
      t.integer :duration, default: 0

      t.timestamps
    end
  end
end
