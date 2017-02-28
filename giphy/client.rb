module Giphy
  class Client

    def initialize
      @endpoint = 'http://api.giphy.com/v1/gifs'      
    end

    def search(term)
      body = RestClient.get(
        "#{@endpoint}/search",
        {
          params: {
            api_key: ENV['GIPHY_KEY'],
            q: CGI.escape(term)
          }
        }
      ).body
      JSON.parse(body)['data'].map{|gif| gif['embed_url'] }
    end



  end
end