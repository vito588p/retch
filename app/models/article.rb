class Article < ApplicationRecord
    #validatations
    validates :title, presence: true

    belongs_to :user
    has_many :comments
end
