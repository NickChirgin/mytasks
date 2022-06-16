class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.references :stage, null: false, foreign_key: true
      t.string :text
      t.boolean :isCompleted

      t.timestamps
    end
  end
end
