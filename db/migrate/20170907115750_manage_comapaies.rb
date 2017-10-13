class ManageComapaies < ActiveRecord::Migration[5.1]
  def change
    add_column( :users , :max_users   , :integer , :default => 0 )
    add_column( :users , :max_issues  , :integer , :default => 0 )
    add_column( :users , :max_options , :integer , :default => 0 )
    add_column( :users , :company_id  , :string  )
  end
end
