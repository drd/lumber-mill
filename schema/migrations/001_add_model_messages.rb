class AddModelMessages < ActiveRecord::Migration
  def self.up
    create_table :messages do |t|
      t.column :spoken_at, :datetime 
      t.column :nick, :string 
      t.column :body, :text 
      t.column :message_type, :integer 
    end    
  end

  def self.down
    drop_table :messages
  end
end
