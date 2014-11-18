require 'csv'

desc "Importing data from the CSV file storage to the database"
task import_data: :environment do
  CSV.open(MessageInfo::STORAGE_FILE_NAME, 'r', MessageInfo::STORAGE_FILE_OPTIONS) do |f|
    f.each { |row| Message.create_from_info row }
  end
end
