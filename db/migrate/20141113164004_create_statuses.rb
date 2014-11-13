class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.text :status
      t.string :user
      t.integer :likes
      t.timestamps
    end
  end
end
