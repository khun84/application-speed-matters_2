class AddIndexToUser < ActiveRecord::Migration
  def change
      add_index :users, :id
  end
end
