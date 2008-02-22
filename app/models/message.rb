
class Message < ActiveRecord::Base

  validates_presence_of :spoken_at
  validates_presence_of :body
  validates_presence_of :nick

  module Type
    ACTION  = 1
    NORMAL  = 2
    
    STRINGS = { " * " => ACTION, " " => NORMAL }
  end

  def self.parse(line)
    # Regular expression are cool, but look like linenoise
    return nil unless line =~ /(\d{4}\/\d{2}\/\d{2} \d{2}:\d{2}:\d{2})( \* | )([<>\S]+) (.*)/ 
    spoken_at    = $1
    message_type = Message::Type::STRINGS[ $2 ]
    nick         = $3.tr("<>","")
    body         = $4

    self.new( :spoken_at    => spoken_at,
              :message_type => message_type,
              :body         => body,
              :nick         => nick )
  end
  
  def action?
    message_type == Type::ACTION
  end
end
