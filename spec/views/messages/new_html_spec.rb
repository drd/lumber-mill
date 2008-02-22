require File.join(File.dirname(__FILE__),'..','..','spec_helper')

describe "/messages/new" do
  before(:each) do
    @controller,@action = get("/messages/new")
    @body = @controller.body
  end

  it "should mention Messages" do
    @body.should match(/Messages/)
  end
end