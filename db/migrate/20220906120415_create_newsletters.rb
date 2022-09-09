class CreateNewsletters < ActiveRecord::Migration[6.1]
  def change
    create_table :news_letters do |t|
      t.string :email_address
      t.timestamps
    end
  end
end
