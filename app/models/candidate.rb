class Candidate < ApplicationRecord
    validates :name, presence: true   #name必填
end
