require 'csv'

class Message < ActiveRecord::Base
  STORAGE_FILE_NAME = Rails.root.join('tmp').join('messages.csv')
  PUBLIC_ATTRS = ["name", "email", "subject", "contents"]

  validates :name, :email, :subject, :contents, presence: true
  validates_email_format_of :email, message: 'does not appear to be an email address'

  def write_to_file_storage
    CSV.open(STORAGE_FILE_NAME, 'ab', col_sep: "\t") do |f|
      f << self.attributes.slice(*PUBLIC_ATTRS).values
    end
  end
end
