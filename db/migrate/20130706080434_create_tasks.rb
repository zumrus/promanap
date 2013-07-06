class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :content
      t.integer :masterid
      t.boolean :status, :default => false
      t.integer :project_id

      t.timestamps
    end
  end
end
