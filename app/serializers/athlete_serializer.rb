class AthleteSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :image_url, :school, :sport, :year, :birthday, :gender, :bio, :email, :phone_number, :username, :password, :athlete

  has_many :deals
  has_many :applications
  has_many :collaborators, through: :deals
end
