class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :content
      t.string :recipient_name

      t.timestamps
    end
  end
end
