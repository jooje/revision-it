require 'spec_helper'

describe "revisions/edit" do
  before(:each) do
    @revision = assign(:revision, stub_model(Revision,
      :hash_code => "MyString",
      :url => "MyString",
      :log => "MyText"
    ))
  end

  it "renders the edit revision form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", revision_path(@revision), "post" do
      assert_select "input#revision_hash_code[name=?]", "revision[hash_code]"
      assert_select "input#revision_url[name=?]", "revision[url]"
      assert_select "textarea#revision_log[name=?]", "revision[log]"
    end
  end
end
