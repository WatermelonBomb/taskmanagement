class CreateTasks < ActiveRecord::Migration[8.0]
  def change
    create_table :tasks do |t|
      t.string :title, null: false, limit: 50
      t.text :memo
      t.date :due_date, null: false
      t.boolean :completed, null: false, default: false

      t.timestamps
    end
  end
end
