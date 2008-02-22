require File.join( File.dirname(__FILE__), "..", "spec_helper" )

describe Message, "line parsing" do

  describe "for well formed lines" do

    before(:each) do
      @well_formed_message                  = "2008/01/18 13:17:39 <ambethia> we are so talkative today"
      @well_formed_action                   = "2008/01/14 11:01:15 * fleas waiting for the truck to get here."
      @well_formed_message_with_weird_nicks = "2008/01/18 13:17:39 <ambe|`thia> k, thx bai."
      # Need to find other examples of oddly named nicks
    end

    it "should parse a message" do
      Message.parse(@well_formed_message).should_not be_an_action
    end

    it "should parse a message for a strangely named nick" do
      Message.parse(@well_formed_message_with_weird_nicks).should_not be_nil
    end

    it "should parse an action" do
      Message.parse(@well_formed_action).should be_an_action
    end

    describe "attributes" do
      before(:each) do
        @message = Message.parse(@well_formed_message)
      end

      it "should remove the angle brackets from a nick" do
        @message.nick.should == "ambethia"
      end
    
      it "should produce a valid date" do
        @message.spoken_at.should be_kind_of(Time)
      end

      it "should produce a non-empty body" do
        @message.body.should_not be_empty
      end
    end
  end

  describe "for malformed lines " do
    it "should not parse a malformed line" do
      Message.parse("I am a malformed line.  Bad line, bad.").should be_nil
    end

    it "should not parse a line with a malformed date" do
      Message.parse("2008/01/XX 13:17:39 <ambethia> we are so talkative today").should be_nil
    end
  end

end

