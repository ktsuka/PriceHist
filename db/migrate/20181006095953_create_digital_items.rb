class CreateDigitalItems < ActiveRecord::Migration[5.2]
  def change
    create_table :digital_items, id: false do |t|
      t.string :itemid
      t.string :store
      t.string :name
      t.string :code
      t.integer :price
      t.string :maker
      t.string :istatus
      t.string :itype
      t.text :memo

      t.timestamps
    end
    execute "ALTER TABLE digital_items ADD PRIMARY KEY (itemid);"
  end
end
