class CreateVoterCounts < ActiveRecord::Migration[5.1]
  def change
    create_table :voter_counts do |t|
      t.integer :user_id
      t.integer :voter_id
      t.timestamps null: false
    end
  end
end
