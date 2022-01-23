class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.references :car, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.datetime :start_at
      t.datetime :end_at
      t.boolean :accepted

      t.timestamps
    end
  end
end
