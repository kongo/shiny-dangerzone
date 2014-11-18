class Person < ActiveRecord::Base
  validates_presence_of :name, :email
  validates_uniqueness_of :email
  validates_email_format_of :email, message: 'does not appear to be an email address'

end
