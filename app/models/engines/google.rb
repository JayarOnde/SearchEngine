module Engines
  class Google < Base
    def url
      "https://www.googleapis.com/customsearch/v1?key=#{api_key}&cx=#{cx_code}"
    end

    def decorate_options(options)
      offset = options.fetch("offset", 1)
      {
        query: { start: offset }
      }
    end

    private

    def api_key
      ENV['GOOGLE_API_KEY'].to_s
    end

    def cx_code
      ENV['GOOGLE_CX_CODE'].to_s
    end
  end
end
