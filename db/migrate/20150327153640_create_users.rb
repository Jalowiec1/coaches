class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :name
      t.integer :age
      t.boolean :if_coach

      t.timestamps 
    end
  end
end
