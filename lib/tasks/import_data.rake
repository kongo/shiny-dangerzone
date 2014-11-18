require 'csv'

desc "Importing data from the CSV file storage to the database"
task import_data: :environment do
  CSV.open(Message::STORAGE_FILE_NAME, 'r', Message::STORAGE_FILE_OPTIONS) do |f|
    f.each do |r|
      Message.create!({
        name:     r[0],
        email:    r[1],
        subject:  r[2],
        contents: r[3]
      })
    end
  end
end
