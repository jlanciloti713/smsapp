class AddFromCityToMessages < ActiveRecord::Migration[5.2]
  def change
    add_column :messages, :from_city, :string
  end
end
