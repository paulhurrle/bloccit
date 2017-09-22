class User < ActiveRecord::Base
    has_many :posts
    has_many :comments
    before_save { self.email = email.downcase if email.present? }
    before_save { self.role ||= :member }
    before_save :formatted_name

    validates :name, length: { minimum: 1, maximum: 100 }, presence: true
    validates :password, presence: true, length: { minimum: 6 }, if: "password_digest.nil?"
    validates :password, length: { minimum: 6 }, allow_blank: true
    validates :email,
        presence: true,
        uniqueness: { case_sensitive: false },
        length: { minimum: 3, maximum: 254 }

    has_secure_password

    enum role: [:member, :admin]

    def formatted_name
        if name
            name_arr = []
            name.split.each do |x|
                name_let = x.split("")
                name_let[0].upcase!
                name_arr << name_let.join
            end
            self.name = name_arr.join(" ")
        end
    end
end
