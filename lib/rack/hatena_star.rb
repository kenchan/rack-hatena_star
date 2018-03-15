require "rack/hatena_star/version"

module Rack
  class HatenaStar
    def initialize(app, options)
      @app, @options = app, options
    end

    def call(env)
      status, headers, body = @app.call(env)
      return [status, headers, body] unless html?(headers)
      return [status, headers, body] if amp?(body)

      res = Rack::Response.new([], status, headers)

      body.each do |b|
        res.write(b.sub('</head>', <<-EOS))
          <script type="text/javascript" src="//s.hatena.ne.jp/js/HatenaStar.js"></script>
          <script type="text/javascript">
            Hatena.Star.Token = "#{@options[:token]}";
            Hatena.Star.SiteConfig = {
              entryNodes: #{@options[:entry_nodes].to_json}
            };
          </script>
          </head>
        EOS
      end
      body.close if body.respond_to? :close

      res.finish
    end

    private

    def html?(headers)
      headers['Content-Type'] =~ /text\/html/
    end

    def amp?(body)
      body.start_with?(%r(<!doctype html>\s*<html (⚡|amp)>))
    end
  end
end
