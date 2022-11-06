class Candidate < ApplicationRecord
    validates :name, presence: true   #name必填
    has_many :vote_logs
end
