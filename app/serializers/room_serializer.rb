class RoomSerializer < ActiveModel::Serializer
  attributes :id, :url, :name, :isPrivate
  has_many :messages
  has_many :users
end
