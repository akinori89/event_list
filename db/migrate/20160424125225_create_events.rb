class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.references :user, null: false
      t.references :prefecture, null: false, default: 48
      t.string :name, null: false, default: ''
      t.string :place, null: false, default: ''
      t.datetime :start_date, null: false
      t.datetime :end_date, null: false
      t.string :url, null: false, default: ''

      t.timestamps null: false
    end
    add_index :events, :name
    add_index :events, :start_date
    add_index :events, :end_date
    add_index :events, :user_id
    add_index :events, :prefecture_id
  end
end
