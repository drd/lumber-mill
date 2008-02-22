require File.join(File.dirname(__FILE__),'..','..','spec_helper')

describe "/messages" do
  before(:each) do
    @controller,@action = get("/messages")
    @body = @controller.body
  end

  it "should mention Messages" do
    @body.should match(/Messages/)
  end
end