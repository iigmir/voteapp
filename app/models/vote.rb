class Vote < ActiveRecord::Base
    belongs_to :User
    has_many :VoterCount, dependent: :destroy
end
