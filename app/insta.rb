require 'instagram'
require 'pp'

Instagram.configure do |config|
  config.client_id = "8ad790cbd00e42c4904ddb1da68489ba"
  config.client_secret = "121d38051e5a42f6bb6f54791fd718fe"
  # For secured endpoints only
  #config.client_ips = '<Comma separated list of IPs>'
end

photo_url = []
photo_comment = []
client = Instagram.client
for media in client.media_search("34.759452599999996","135.51685999999998")
  photo_url << media.images.thumbnail.url
  photo_comment << media.caption.text
end

#pp html
pp photo_comment
