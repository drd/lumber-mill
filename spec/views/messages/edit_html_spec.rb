require File.join(File.dirname(__FILE__),'..','..','spec_helper')

describe "/messages/edit" do
  before(:each) do
    @controller,@action = get("/messages/edit")
    @body = @controller.body
  end

  it "should mention Messages" do
    # @body.should match(/Messages/)
  end
end