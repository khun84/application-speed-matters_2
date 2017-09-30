class UpdateTotalPointsInUsers < ActiveRecord::Migration
  def up
      execute "update users
set total_points = b.points
from (select user_id, sum(value) as points from points group by user_id) as b
where users.id = b.user_id"
  end

    def down
        execute "update users set total_points = 0"
    end
end
