class AdminRootController < ApplicationController
    before_action :authenticate_user!
    before_action do 
        # 用戶並沒有管理權限
        redirect_to root_path unless current_user && current_user.system_administrator
    end
    
    def index
    end
end