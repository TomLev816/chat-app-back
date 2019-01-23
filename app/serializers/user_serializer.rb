class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :room_id
  has_many :messages
end
