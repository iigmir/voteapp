class VotesController < ApplicationController
    before_action :authenticate_user!
    before_action do
        # 管理員並沒有投票權限
        redirect_to admin_system_index_path unless current_user && current_user.user_is_admin == false
    end
    
    def index
        @vote_options = Vote.all
        @my_vote = VoterCount.where( "user_id = ?" , current_user.id )
        @return_api = { "options" => @vote_options , "myvote" => @my_vote }
        respond_to do |format|
            format.html
            format.json {render :json => @return_api}
        end
    end
    
    # For Vote Feature
    def upvote
        @vote = Vote.find(params[:id])
        user_voted_item = VoterCount.where( "user_id = ? and vote_id = ?" , current_user.id , params[:id] )
        
        if user_voted_item.count > 0
            # user voted before, so need to cancel vote
            user_voted_item.first.destroy
            flash[:notice] = '取消投票成功！'
        else
            user_voted_count = VoterCount.where("user_id = ?", current_user.id).count
            user_allowed_votes = 1
            
            if user_voted_count < user_allowed_votes
                new_vote = @vote.VoterCount.create
                new_vote.update_attributes("user_id" => current_user.id)
                flash[:notice] = '投票成功！'
            else
                flash[:alert] = '您已經超過投票上限了。'
            end
        end

        redirect_to votes_path
    end
    
    # Privates
    private
    def set_voteid
        @vote = Vote.find(params[:id])
    end
    
    def vote_params
        params.require(:vote).permit(:item)
    end
end
