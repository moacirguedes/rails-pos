class Profile < ActiveRecord::Base
  belongs_to :user
  has_many :purchases
  validates_presence_of :name, :age
end
