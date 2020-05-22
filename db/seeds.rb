# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Guest.destroy_all

require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'daily_show_guests.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.first(100).each do |row|
  g = Guest.find_or_initialize_by(name: row['Raw_Guest_List'].split(',').first )
  g.occupation = row['GoogleKnowlege_Occupation']
  g.save
end

date = Date.parse('2015-09-08')

(1..40).each do |num|
  Episode.create(date: date, number: num)
  date = date.next
end

g = Guest.all.first 
e = Episode.all.first
g_2 = Guest.all.last
e_2 = Episode.all.last
a = Appearance.create(episode_id: e.id, guest_id: g.id)
a_2 = Appearance.create(episode_id: e_2.id, guest_id: g_2.id)