class CreateSummaryItems < ActiveRecord::Migration[5.2]
  def change
    create_table :summary_items, id: false do |t|
      t.string :itemdate
      t.string :category
      t.integer :count
      t.integer :totalprice
      t.integer :newitem
      t.integer :olditem

      t.timestamps
    end
    execute "ALTER TABLE summary_items ADD PRIMARY KEY (itemdate,category);"
  end
end
