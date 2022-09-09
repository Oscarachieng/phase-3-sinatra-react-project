class AddImageUrlToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :image_url, :string
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
