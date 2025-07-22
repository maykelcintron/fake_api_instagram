class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :lastname
      t.string :username
      t.string :email

      t.timestamps
    end
  end

  add_index :users, :username, unique: true
  add_index :users, :email, unique: true
end
