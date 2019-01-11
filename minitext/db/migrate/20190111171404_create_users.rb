class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users, sequence_start_value: 1 do |t| #em oracle a sequencia inicia por default com 10000 devido ao ruby-oci8
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
