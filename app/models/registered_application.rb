class RegisteredApplication < ActiveRecord::Base

  belongs_to :user
  has_many :events
  validates_format_of :url, :with => URI::regexp(%w(http https))
  validates :name, length: { minimum: 2 }, presence: true
end
