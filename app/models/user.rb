class User < ActiveRecord::Base
    before_save { self.email = email.downcase if email.present? }
    before_save :formatted_name

    validates :name, length: { minimum: 1, maximum: 100 }, presence: true
    validates :password, presence: true, length: { minimum: 6 }, if: "password_digest.nil?"
    validates :password, length: { minimum: 6 }, allow_blank: true
    validates :email,
        presence: true,
        uniqueness: { case_sensitive: false },
        length: { minimum: 3, maximum: 254 }

    has_secure_password

    def formatted_name
        if name
            name_arr = []
            name.split.each do |x|
                name_arr << x.capitalize
            end
            self.name = name_arr.join(" ")
        end
    end
end
