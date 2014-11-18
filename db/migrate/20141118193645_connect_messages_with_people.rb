class ConnectMessagesWithPeople < ActiveRecord::Migration
  def change
    remove_column :messages, :name
    remove_column :messages, :email
    add_column :messages, :person_id, :integer
    add_index :messages, :person_id
  end
end
