class User < ActiveRecord::Base
  has_many :positions
  has_many :trades, through: :positions

  has_secure_password

  def slug
    self.username.split(/[^\w]/).map{|s| s.downcase}.join("-")
  end

  def self.find_by_slug(slug)
    self.all.find {|s| s.slug == slug}
  end
end