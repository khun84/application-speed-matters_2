class AddIndexToPoints < ActiveRecord::Migration
  def change
      add_index :points, :user_id
  end
end
