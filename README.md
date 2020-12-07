[![Build Status](https://travis-ci.org/dreamingblackcat/mmunicode_rails.svg?branch=master)](https://travis-ci.org/dreamingblackcat/mmunicode_rails)  [![Gem Version](https://badge.fury.io/rb/mmunicode_rails.svg)](http://badge.fury.io/rb/mmunicode_rails) ![](http://ruby-gem-downloads-badge.herokuapp.com/mmunicode_rails?type=total)
# mmunicode-rails

The gem aims for Myanmar language users who suffered in a never Ending war between Zawgyi and Unicode fonts for Myanmar language.

This is by no means a complete solution. It's just a convenient helper gem.

"mmunicode_rails" lets you convert you rails app input data to Myanmar Unicode regardless of which fonts the users used. 

Supported for rails 4.x and 3.x

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'mmunicode_rails'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mmunicode_rails

## Usage

Currently mmunicode_rails supports two approach:
1. Inserting as a middleware that intercepts all params and convert it to Myanmar Unicode
2. Adding an ActiveRecord class macro that will convert specify string or text fields before saving a model

### Middleware Example

After bundling the gem, a rails generator for mmunicode_rails will be added to your rails app.

Run the generator:
```sh
rails generate mmunicode_rails:initializer
```
This will produce `config/initializers/mmunicode_rails.rb` file. The file include code for inserting `RackMmunicode` middleware when your rails app is initialized.

And that's it. Now every request parameters(including query string parameters) will get converted to unicode in the rack layer.

### ActiveRecord Example

If there is an ActiveRecord model with schema like this:
```ruby
ActiveRecord::Schema.define(:version => 0) do
  create_table :posts do |t|
    t.text :body
    t.string :title
    t.integer :view_count
  end
end
```
You can specify the field you would like to convert to unicode before saving to database like this: 
```ruby
class Post < ActiveRecord::Base
	mmunicode_convert :title,:body
end
```
This will register a before_save hook that converts the incoming input to unicode if it's written in zawgyi. That way you can let your users enter data in Zawgyi font while still using Unicode in your site.

The conversion is supported only for :string and :text type. Specifying any other types will raise an `NotSupportedForNonStringTypesError`.
eg:
```ruby
class Post < ActiveRecord::Base
	mmunicode_convert :title,:body,:view_count
end
```
The above code will raise Error.

### Custommizing

If you don't like both approach, you can include `MmunicodeRails::Core` module for converter methods.(for zg to unicode => `zg12uni51,for unicode to zg => `uni512zg1 , detecting_font => `detect_font`) All accepts an input string. converter methods produce converted output string. `detect_font` returns :unicode, :zawgyi depending on fonts. If it's not Myanmar Font it will return `nil`. If it's unsure of which font, it will prefer :zawgyi.

For example, if you want to register as a controller before_filter:
```ruby
class PersonController < ApplicationController
	include MmunicodeRails::Core
	before_filter :change_name_to_unicode

	private
		def change_name_to_unicode
			zg12uni51(person_params[:name]) if person_params[:name]
		end
end
```

## TODO
- To add client side js support for font users' convenience
- To add font embed files in generator.
- To add helper functions for myanmar word processing(Long Term goal)

## Contributing

Any form of feedback or contribution is welcome. Please do post an issue if there is something you would like to add as a feature or if you find a bug.
An issue/pull request can make the contributors of the project very happy. Don't be shy or afraid!

If you would like to contribute then

1. Fork it ( https://github.com/dreamingblackcat/mmunicode_rails/fork )

2. Create your feature branch (`git checkout -b my-new-feature`)

3. Commit your changes (`git commit -am 'Add some feature'`)

4. Push to the branch (`git push origin my-new-feature`)

5. Create a new Pull Request

## Credits

- [Ye Lin Aung](https://github.com/yelinaung) for his awesome [mmfont](https://github.com/yelinaung/mmfont) gem.

- [Thura Hlaing](https://github.com/trhura) for his excellent [paytan](https://github.com/trhura/paytan) converter generator.

- [Green Like Orange](https://github.com/greenlikeorange) for his great font detection code in [knayi](https://github.com/greenlikeorange/knayi-myscript) script.

## LICENSE

The project is under GNU LESSER GENERAL PUBLIC LICENSE. You can view the license terms [here](LICENSE.txt).
