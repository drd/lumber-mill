require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

describe "Messages Controller", "index action" do
  before(:each) do
    @controller = Messages.build(fake_request)
    @controller.dispatch('index')
  end
end