# Risingtide
[![Circle CI](https://circleci.com/gh/iamgerwin/risingtide.svg?style=svg)](https://circleci.com/gh/iamgerwin/risingtide)

Rising tide R6 SMS Gateway gem, a simple messaging gateway API in the Philippines.
you can find them @ http://risingtide.ph/

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'risingtide'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install risingtide

## Usage
Initialize Sms

    @risingtide = Risingtide::Sms.new(username, password, shortcode)

Send out Sms

    @risingtide.send_sms(to, message, usagetype, from_alias)

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/risingtide. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

