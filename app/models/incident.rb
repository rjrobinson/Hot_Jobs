class Incident < ActiveRecord::Base
  mount_uploader :incident_photos, IncidentPhotosUploader

  belongs_to :incident_type
  belongs_to :user
  has_many :updates, dependent: :destroy
  has_many :comments, dependent: :destroy

  geocoded_by :address
  before_validation :geocode, if: :address_changed?

  validates :description, presence: true, length: { maximum: 100 }
  validates :address, presence: true
  validates :longitude, presence: true, length: { minimum: 1, maximnum: 6   }
  validates :latitude, presence: true, length: { minimum: 1, maximnum: 6   }
end
