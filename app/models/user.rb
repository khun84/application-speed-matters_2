class User < ActiveRecord::Base
    has_many :points

    validates :first_name, presence: true
    validates :last_name, presence: true

    validates :username,
              presence: true,
              length: {minimum: 2, maximum: 32},
              format: {with: /^\w+$/, multiline: true},
              uniqueness: {case_sensitive: false}

    validates :email,
              presence: true,
              format: {with: /^[\w+\-.]+@[a-z\d\-.]+\.[a-z]+$/i, multiline: true},
              uniqueness: {case_sensitive: false}

    scope :paginate_limit, -> {
            limit(per_page)
    }

    def self.by_total_points
        order('total_points desc')
    end

    def self.page(page_number)
        page_number||=1

        offset_number = (page_number - 1) * per_page

        offset(offset_number).paginate_limit
    end

    def self.per_page
        10
    end


    def full_name
        "#{first_name} #{last_name}"
    end

    private


end
