class User < ActiveRecord::Base
  def self.find_or_create_from_auth_hash(auth_hash)
    User.find_or_create_by(uid: auth_hash[:uid], provider: auth_hash[:provider], username: auth_hash[:info][:email], avatar_url: auth_hash[:info][:image])
  end

  validates :username, presence: true
  has_many :questions
end
