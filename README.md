# Rack::HatenaStar

Simple Rack middleware to help injecting the [Hatena Star](https://s.hatena.ne.jp/) code in your website.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rack-hatena_star'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rack-hatena_star

## Usage

Add it to your middleware stack.

```ruby
config.middleware.use(
  Rack::HatenaStar,
  token: 'your_hatena_star_token',
  entry_nodes: [
    'your_article_selector' => [
      uri: 'your_permalink_selector',
      title: 'your_title_selector',
      container: 'your_title_container_selector'
    }
  }
)
```

See http://d.hatena.ne.jp/hatenastar/20070707 for details about `entry_nodes`.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/kenchan/rack-hatena_star. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
