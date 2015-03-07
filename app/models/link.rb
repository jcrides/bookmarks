class Link < ActiveRecord::Base
  validates :name, presence: true, length: { in: 4..50 }
  validates :url, presence: true

  belongs_to :folder

end
