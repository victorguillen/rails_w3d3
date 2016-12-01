# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ActiveRecord::Base.transaction do

  User.destroy_all
  user1 = User.create(:email => "CJ@fmail.com")
  user2 = User.create(:email => "Flarnie@fmail.com")
  user3 = User.create(:email => "Jeff@fmail.com")
  user4 = User.create(:email => "Georges_Pierre@fmail.com")
  user5 = User.create(:email => "Ned@fmail.com")

  ShortenedUrl.destroy_all
  ShortenedUrl.create(:user_id => user3.id, :long_url => "https://www.google.com/", :short_url => "https://goo.gl/Njku")
  ShortenedUrl.create(:user_id => user4.id, :long_url => "https://github.com/", :short_url => "https://goo.gl/un5E")
  ShortenedUrl.create(:user_id => user1.id, :long_url => "https://www.facebook.com/", :short_url => "https://goo.gl/3Y8P")

end
