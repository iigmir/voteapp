# 模擬投票
unvote_members = User.where(user_is_admin: false).count - VoterCount.count
unvote_members.times do |i|
    # 冊生選項
    option_id = rand(1...Vote.count)
    existed_option = Vote.where("id = ?", option_id).count
    while existed_option < 1
        # 選項被刪除就要重新產生
        option_id = rand(1...Vote.count)
        existed_option = Vote.where("id = ?", option_id).count
    end
    
    # 冊生用戶
    voters_id = rand(1..User.count)
    is_voted = VoterCount.where("user_id = ?", voters_id).count
    while is_voted > 0
        # 用戶已經投過就要重新產生
        voters_id = rand(1..User.count)
        is_voted = VoterCount.where("user_id = ?", voters_id).count
    end
    
    VoterCount.create!(
        :vote_id => option_id,
        :user_id => voters_id
    )
end