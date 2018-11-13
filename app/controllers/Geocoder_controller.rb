require 'net/http'
require 'uri'

def Geocoder
  uri = URI.parse("https://dapi.kakao.com/v2/local/geo/coord2address.json?x=#{x}&y=#{y}&input_coord=WGS84")
  request = Net::HTTP::Get.new(uri)
  request["Authorization"] = "KakaoAK 7fa3e5659f60e42c90c69a337a299148"
  
  req_options = {
    use_ssl: uri.scheme == "https",
  }
  
  response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
    http.request(request)
  end

end
# response.code
# response.body