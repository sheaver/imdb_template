class CreateInvestments < ActiveRecord::Migration
  def change
    create_table :investments do |t|
      t.string :name
      t.string :entity
      t.string :sponsor
      t.string :asset_type
      t.string :geography
      t.string :industry
      t.boolean :real_estate
      t.float :current_value

      t.timestamps

    end
  end
end
