require 'spec_helper'

describe "revisions/new" do
  before(:each) do
    assign(:revision, stub_model(Revision,
      :hash_code => "MyString",
      :url => "MyString",
      :log => "MyText"
    ).as_new_record)
  end

  it "renders new revision form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", revisions_path, "post" do
      assert_select "input#revision_hash_code[name=?]", "revision[hash_code]"
      assert_select "input#revision_url[name=?]", "revision[url]"
      assert_select "textarea#revision_log[name=?]", "revision[log]"
    end
  end
end
