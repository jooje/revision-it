class CreateRevisions < ActiveRecord::Migration
  def change
    create_table :revisions do |t|
      t.string :hash_code
      t.string :url
      t.text :log

      t.timestamps
    end
  end
end
