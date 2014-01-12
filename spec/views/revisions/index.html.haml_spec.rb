require 'spec_helper'

describe "revisions/index" do
  before(:each) do
    assign(:revisions, [
      stub_model(Revision,
        :hash_code => "Hash Code",
        :url => "Url",
        :log => "MyText"
      ),
      stub_model(Revision,
        :hash_code => "Hash Code",
        :url => "Url",
        :log => "MyText"
      )
    ])
  end

  it "renders a list of revisions" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Hash Code".to_s, :count => 2
    assert_select "tr>td", :text => "Url".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
