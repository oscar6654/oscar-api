class RegisteredApplication < ActiveRecord::Base

  belongs_to :user
  validates_format_of :URL, :with => URI::regexp(%w(http https))
end
