require 'sinatra'
require 'sinatra/reloader' if development?
require 'instagram'

get '/' do

  Instagram.configure do |config|
    config.client_id = "8ad790cbd00e42c4904ddb1da68489ba"
    config.client_secret = "121d38051e5a42f6bb6f54791fd718fe"
    # For secured endpoints only
    #config.client_ips = '<Comma separated list of IPs>'
  end

  @results = []
  client = Instagram.client
  for media in client.media_search("34.759452599999996","135.51685999999998")
    @results << {:photo_url => media.images.thumbnail.url,
                 :photo_comment => media.caption.text}
  end

  erb :map
end
