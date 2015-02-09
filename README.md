# mmunicode-rails

The gem aims for Myanmar language users who suffered in a never Ending war between Zawgyi and Unicode fonts for Myanmar language.

"mmunicode_rails" provides a class macro for activerecord which allows designated string fields to convert from zawgyi font to unicode font before saving.

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

###Example
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

## Contributing
Any form of feedback or contribution is welcome. Please do post an issue if there is something you would like to add as a feature.
An issue can make the contributors of the project very happy. Don't be shy or afraid!

If you would like to contribute then 
1. Fork it ( https://github.com/dreamingblackcat/mmunicode_rails/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

##Credits

[Ko Thura Hlaing](https://github.com/trhura) for his excellent [paytan](://github.com/trhura/paytan) converter generator.
[Green Like Orange](https://github.com/greenlikeorange) for showing his js font detection code

##LICENSE

The project is under GPL license. You can view the license terms [here](LICENSE.txt).