test_group = ["foo" , "bar" , "cec" , "2000" , "gecd"]

if Vote.count < 1
    test_group.each do |team|
        Vote.create!( :item => team )
    end
end

# Generate Administrator
admin_number = User.where("user_is_admin = ?", true).count
if admin_number < 1
    User.create!(
        :company_id => 'admin',
        :account_name => 'administrator',
        :email => 'root@127.0.0.1',
        :password => 'abc"123',
        :password_confirmation => 'abc"123',
        :user_is_admin => true,
        :can_watch_result => true,
        :can_edit_user => true,
        :can_edit_company => true,
        :user_is_company => true,
        :system_administrator => true
    )
end
