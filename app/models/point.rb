class Point < ActiveRecord::Base
    belongs_to :user

    validates :user, presence: true
    validates :value, numericality: {only_integer: true, greater_than_or_equal_to: 0}
    validates :label, presence: true

    after_create :increase_points

    private

    def increase_points
        user = User.find(self.user_id)
        # user.total_points+=self.value

        user.increment(:total_points, self.value)
        # new_point = user.total_points + self.value
        # user.update_attribute :total_points, new_point

    end
end
