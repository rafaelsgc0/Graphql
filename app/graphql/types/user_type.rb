module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :first_name, String, null: true
    field :last_name, String, null: true
    field :street, String, null: true
    field :number, Integer, null: true
    field :city, String, null: true
    field :postcode, String, null: true
    field :country, String, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :full_name, String, null: false
    def full_name
      "#{object.first_name} #{object.last_name}"
    end
    field :full_address, String, null: true

    field :posts, [Types::PostType], null: true, description: 'bring the posts of the user'
    def posts
      Post.where(user: object)
    end

    # field :address, String, null: false
    # def address
    #   ([:street, :number, :postcode, :city, :country].map do |a|
    #     object.send(a)&.strip
    #   end.compact - ['']).join(', ')
    # end

  end
end
