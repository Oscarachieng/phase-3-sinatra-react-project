class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email_address
      t.string :location
      t.timestamps
    end
  end
end
