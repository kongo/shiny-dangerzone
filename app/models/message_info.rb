require 'csv'

class MessageInfo
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  STORAGE_FILE_NAME = Rails.root.join('tmp').join('messages.csv')
  STORAGE_FILE_OPTIONS = { col_sep: ";", encoding: "UTF-8", row_sep: "\r\n" }
  PUBLIC_ATTRS = ["name", "email", "subject", "contents"]

  attr_accessor :name, :email, :subject, :contents
  validates :name, :email, :subject, :contents, presence: true
  validates_email_format_of :email, message: 'does not appear to be an email address'

  def initialize(params = {})
    params.slice(*PUBLIC_ATTRS).each { |n, v| send "#{n}=", v }
  end

  def save
    CSV.open(STORAGE_FILE_NAME, 'a', STORAGE_FILE_OPTIONS) do |f|
      f << PUBLIC_ATTRS.map { |a| self.send a }
    end
  end
end
