class CreateVotes < ActiveRecord::Migration[5.1]
    def change
        create_table :votes do |t|
            t.string :item
            t.timestamps null: false
        end
    end
end
