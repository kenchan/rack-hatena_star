require 'test/unit'
require 'power_assert'
require 'rack/test'
require 'rack/hatena_star'
require 'json'

class TestApp
  def call(env)
    [
      200,
      {'Content-Type' => 'text/html'},
      ['<html><head></head><body></body></html>']
    ]
  end
end

class RackHatenaStarTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    builder = Rack::Builder.new
    builder.use ::Rack::HatenaStar, {token: @token, entry_nodes: @entry_nodes}
    builder.run TestApp.new
    builder.to_app
  end

  def setup
    @token = 'your_token'
    @entry_nodes = {
      article: {
        uri: 'h2 a',
        title: 'h2',
        container: 'h2'
      }
    }
  end


  def test_include_hatena_star_js
    get '/'

    assert { last_response.body.include? 'src="//s.hatena.ne.jp/js/HatenaStar.js"' }
  end

  def test_set_token
    get '/'

    assert { last_response.body.include? %Q{Hatena.Star.Token = \"#{@token}\"} }
  end

  def test_set_entry_nodes
    get '/'

    puts last_response.body
    assert last_response.body.include? @entry_nodes.to_json
  end
end
