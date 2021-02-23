module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :users, [UserType], null: true
    def users
      User.all
    end

    field :user, [UserType], null: true, description: 'select one user' do
      argument :id, ID, required: true
    end
    def user(id:)
      User.where(id: id)
    end

  end
end
