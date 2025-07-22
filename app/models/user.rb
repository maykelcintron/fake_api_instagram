class User < ApplicationRecord
    has_many :posts

    validates :name, :lastname, :username, :email, presence: true
    validates :username, :email, uniqueness: true
end