require 'spec_helper'

describe "revisions/show" do
  before(:each) do
    @revision = assign(:revision, stub_model(Revision,
      :hash_code => "Hash Code",
      :url => "Url",
      :log => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Hash Code/)
    rendered.should match(/Url/)
    rendered.should match(/MyText/)
  end
end
