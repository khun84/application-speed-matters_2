class ChangeUsersTotalPointsDefault < ActiveRecord::Migration
  def change
      change_column_default :users, :total_points, 0
  end
end
