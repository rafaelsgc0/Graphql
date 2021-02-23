module Types
  class PostType < Types::BaseObject
    field :id, ID, null: false
    field :user_id, Integer, null: false
    field :body, String, null: true
    field :comment, Types::CommentType, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :comments, Types::CommentType, null: true,
          description: 'all the comments from a post'
    def comments
      Comment.where(post: object)
    end
    field :comments, [Types::CommentType], null: true, description: 'bring the posts of the user'
    def posts
      Comment.where(post: object)
    end

  end
end
