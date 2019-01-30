class CreateMicroposts < ActiveRecord::Migration[5.2]
  def change
    create_table :microposts, sequence_start_value: 1  do |t|
      t.text :content
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :microposts, [:user_id, :created_at]
  end
end
