class Link < ActiveRecord::Base
  validates :name, presence: true, length: { in: 4..50 }
  validates :url, presence: true

  belongs_to :folder

  def self.split_url(url)
    if url.index('/', 8)
      site = url[0..(url.index('/', 8) - 1)]
      path = url[url.index('/', 8)..-1]
    else
      site = url
      path = '/'
    end

    return site, path
  end

end
