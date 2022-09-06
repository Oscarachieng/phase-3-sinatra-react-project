class CreateNewsletters < ActiveRecord::Migration[6.1]
  def change
    create_table :newletters do |t|
      t.string :emaila_address
      t.timestamps
    end
  end
end
