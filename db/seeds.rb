# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "csv"

CSV.foreach('db/data/20181005.csv') do |row|
  DigitalItem.create(:itemid => row[0], :store => row[1], :name => row[2], :price => row[3],
                     :maker => row[4],:istatus => row[5], :itype => row[6],
                     :memo => row[7],:code => row[8],)
end
