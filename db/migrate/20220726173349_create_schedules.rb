class CreateSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :schedules do |t|
      t.string :title
      t.date :start_date
      t.date :end_date
      t.boolean :whole_day, null: false

      t.timestamps
    end
  end
end
