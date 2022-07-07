class Collaborator < ApplicationRecord
    has_secure_password

    has_one_attached :image
    has_many :deals
    has_many :applications, through: :deals
    has_many :athletes, through: :deals

    validates :username, presence: true, uniqueness: true, length: { maximum: 20 }

    # PASSWORD_REQUIREMENTS = /\A
    #     (?=.{8,30})        # Must contain between 8 and 30 characters
    #     (?=.*\d)           # Must contain a digit
    #     (?=.*[a-z])        # Must contain a lower case character
    #     (?=.*[A-Z])        # Must contain an upper case character
    #     (?=.*[[:^alnum:]]) # Must contain a symbol
    # /x

    # validates :password, format: PASSWORD_REQUIREMENTS
end
