class Incident < ActiveRecord::Base
  belongs_to :incident_type
  
  geocoded_by :address
  before_validation :geocode, if: :address_changed?


  validates :address, presence: true
  validates :name, presence: true
  validates :longitude, presence: true, length: { minimum: 1, maximnum: 6   }
  validates :latitude, presence: true, length: { minimum: 1, maximnum: 6   }
end
