class Folder < ActiveRecord::Base
  validates :name, presence: true, length: { in: 4..50 }

  has_many :links, dependent: :destroy

end
