class Position < ActiveRecord::Base
  belongs_to :user
  has_many :trades

end