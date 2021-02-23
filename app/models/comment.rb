class Comment < ApplicationRecord
  belongs_to :user, inverse_of: :user_comments
  belongs_to :post, inverse_of: :comments
end
