# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

room = Room.create(url: 'https://www.youtube.com/watch?v=zNY-qzp7pD0' , name: 'Babish: Crème de la Crème', isPrivate: false)
puts room

room = Room.create(url: 'https://www.youtube.com/watch?v=hu9pTGFjA4c' , name: 'Oh Wonder - Ultralife', isPrivate: false)
puts room

user = User.create(username: 'tom' , password: 'tom', room_id: 1)
puts user

user = User.create(username: 'maria' , password: 'maria', room_id: 2)
puts user
