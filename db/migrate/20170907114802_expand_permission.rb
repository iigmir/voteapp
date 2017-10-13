class ExpandPermission < ActiveRecord::Migration[5.1]
  def change
    add_column( :users , :can_watch_result , :boolean , :default => false )
    add_column( :users , :can_edit_user    , :boolean , :default => false )
    add_column( :users , :can_edit_company , :boolean , :default => false )
    add_column( :users , :user_is_company  , :boolean , :default => false )
    add_column( :users , :system_administrator , :boolean , :default => false )
  end
end
