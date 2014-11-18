class Message < ActiveRecord::Base
  belongs_to :person

  def self.create_from_info(info)
    Message.create!({
      person:   self.corresponding_person(info[0], info[1]),
      subject:  info[2],
      contents: info[3]
    })
  end

  def self.corresponding_person(name, email)
    Person.where(email: email).first ||
      Person.create!({name: name, email: email})
  end
  
end
