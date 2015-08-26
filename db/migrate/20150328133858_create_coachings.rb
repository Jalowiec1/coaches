class CreateCoachings < ActiveRecord::Migration
  def change
    create_table :coachings do |t|
      t.integer :student_id
      t.integer :coach_id

      t.timestamps
    end
  end
end
