class Point < ActiveRecord::Base
    belongs_to :user

    validates :user, presence: true
    validates :value, numericality: {only_integer: true, greater_than_or_equal_to: 0}
    validates :label, presence: true

    after_save :increase_points

    private

    def increase_points
        user = User.find(self.user_id)
        user.total_points+=self.value

        unless user.save
            flash[:alert] = user.errors.messages[:total_points][0]
        end
    end
end
