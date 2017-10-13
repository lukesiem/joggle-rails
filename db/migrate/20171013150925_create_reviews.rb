class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :product_id
      t.string :user_id
      t.string :integer
      t.string :description
      t.string :text
      t.integer :rating
      t.datetime :createat
      t.datetime :updateat

      t.timestamps null: false
    end
  end
end
