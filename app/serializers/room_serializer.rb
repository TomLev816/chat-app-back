class RoomSerializer < ActiveModel::Serializer
  attributes :id, :url
  has_many :messages
  has_many :users
end
