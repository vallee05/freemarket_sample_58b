class CreateShippingAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :shipping_addresses do |t|
      t.string :postal_code,null: false
      t.string :prefecture,null: false
      t.string :city,null: false
      t.string :address,null: false
      t.string :building_name
      t.references :user,foreign_key: true

      t.timestamps
    end
  end
end
