# Lift

[![Build Status](https://travis-ci.org/ahawkins/lift.svg)](https://travis-ci.org/ahawkins/lift)

Micro library for common pattern of initializing an object with a hash
and yielding itself to a block. This pattern is repeated widely across
the Ruby ecosystem. I duplicated this code across multiple projects
and eventually got sick of it so give you Lift!

## Installation

Add this line to your application's Gemfile:

    gem 'lift'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install lift

## Usage

```ruby
class Person
  include Lift

  attr_accessor :name, :email
end

Person.new name: 'adam', email: 'example@example.com'

Person.new name: 'adam' do |adam|
  adam.email = 'example@example.com'
end
```

NOTE: Lift calls `super` with no arguments. This is so it can be used in
classes that include modules with their own `initialize` method. If an
ancestor's `initialize` method takes arguments then you should not use
this library.

## Contributing

1. Fork it ( https://github.com/[my-github-username]/lift/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
