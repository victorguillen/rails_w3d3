class Visit < ActiveRecord::Base
  belongs_to(
  :visited_url,
  :class_name => "ShortenedUrl",
  :foreign_key => :short_url_id,
  :primary_key => :id
  )

  belongs_to(
  :visitor,
  :class_name => "User",
  :foreign_key => :user_id,
  :primary_key => :id
  )

  def self.record_visit!(user, shortened_url)
    Visit.create(:user_id => user.id, :short_url_id => shortened_url.id)
  end


  validates :user_id, :short_url_id, :presence => true
end
