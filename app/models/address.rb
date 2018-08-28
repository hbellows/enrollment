class Address < ApplicationRecord
  validates_presence_of :description
  validates_presence_of :street_address
  validates_presence_of :city
  validates_presence_of :state
  validates_presence_of :zip_code

  belongs_to :student
end
