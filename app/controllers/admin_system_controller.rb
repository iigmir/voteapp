class AdminSystemController < ApplicationController
    before_action :authenticate_user!
    before_action do 
        # 用戶並沒有管理權限
        redirect_to root_path unless current_user && current_user.user_is_admin
    end
    
    def index
        @vote_options = Vote.select( :id , :item )
        @voter_votes = VoterCount.select( :id , :vote_id )
        @votes_index_api = { "vote_options" => @vote_options , "voter_votes" => @voter_votes }
        respond_to do |format|
            format.html # index.html.erb
            format.json { render json: @votes_index_api }
        end
    end
    def show
        @votes_src = VoterCount.where( "vote_id = ?", params[:id] )
        @vvoters = @votes_src.map{|item| item.user_id }
        @voter_info = []
        @vvoters.find_all do |u|
            @voter_info.push( User.select( :id , :email , :account_name ).where( "id = ?" , u ) )
        end
        @info_api = { "votes" => @votes_src , "voter_info" => @voter_info }
        
        respond_to do |format|
            format.html
            format.json { render json: @info_api }
        end
    end
    
    def new
        @item = Vote.new
    end
    def create
        Vote.create( vote_params )
        redirect_to admin_system_index_path
    end
    
    def edit
        @vote = Vote.find(params[:id])
    end
    def update
        Vote.find(params[:id]).update_attributes(vote_params)
        redirect_to admin_system_index_path
    end
    
    def destroy
        @vote = Vote.find(params[:id])
        @vote.destroy
        redirect_to admin_system_index_path
    end
    
    def get_all_votes
        ## http://railscasts.com/episodes/362-exporting-csv-and-excel
        ## http://blog.csdn.net/sxs_smile/article/details/71513396
        @votes_xlsx = VoterCount.all
        respond_to do |format|
            format.xls
            format.xlsx
        end
    end
    
    private
    def set_voteid
        @vote = Vote.find(params[:id])
    end
    def vote_params
        params.require(:vote).permit(:item)
    end
end