class ShortenedUrl < ActiveRecord::Base
  include SecureRandom

  belongs_to(
  :submitter,
  :class_name => "User",
  :foreign_key => :user_id,
  :primary_key => :id
  )

  has_many(
  :visits,
  :class_name => "Visit",
  :foreign_key => :short_url_id,
  :primary_key => :id
  )

  has_many(
  :visitors,
  Proc.new { distinct },
  :through => :visits,
  :source => :visitor
  )

  def num_clicks
    self.visits.size
  end

  def num_uniques
    self.visits.select(:user_id).distinct.size
  end

  def self.random_code
    SecureRandom.base64(15)
  end

  def self.create_for_user_and_long_url!(user, long_url)
    our_first_domain = "http://lefties.gl/"
    rand_code = our_first_domain + self.random_code
    while self.exists?(:short_url => rand_code)
      rand_code = our_first_domain + self.random_code
    end
    ShortenedUrl.create(:user_id => user.id, :long_url => long_url, :short_url => rand_code)
  end


  validates :short_url, :uniqueness => true
  validates :long_url, :user_id, :presence => true
end
