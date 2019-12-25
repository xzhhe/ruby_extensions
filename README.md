# RubyExtensions

主要是对 Ruby 系统类提供的方法、常用的 Ruby 代码片段, 进行简易的二次封装, 提供更简洁的调用方式。


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ruby_extensions'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ruby_extensions

## 目前支持的类型

- String
- Hash
- Array
- File

## Usage

比如，你需要使用 Ruby 对一个字符串计算得到 MD5 值, 那么你能需要写如下几行代码:

```ruby
require 'digest'
puts Digest::MD5.hexdigest('111111') #=> 96e79218965eb72c92a549dd5a330112
```

使用 ruby_extensions 这个库之后, 可以变得更加的优雅:

```ruby
require 'ruby_extensions'
puts '111111'.ext_md5 #=> 96e79218965eb72c92a549dd5a330112
```

再比如, 你需要读取一个 json 文件, 然后转换为 OpenStruct, 那么你可以可能这样写:

```ruby
require 'ostruct'
os = JSON.parse(File.read('/Users/xiongzenghui/Desktop/xzhworkspace/demo.json'), object_class: OpenStruct)
puts os.name
```

使用 ruby_extensions 这个库之后, 可以变得更加的优雅:

```ruby
require 'ruby_extensions'
os = read_json_to_obj('/Users/xiongzenghui/Desktop/xzhworkspace/demo.json')
puts os.name
```

再比如, 你需要把一个字符串写入到文件中:

```ruby
File.open(file, 'w+') { |f| f.write('我是写入的文件内容') }
```

使用 ruby_extensions 这个库之后, 可以变得更加的优雅:

```ruby
require 'ruby_extensions'
'我是写入的文件内容'.ext_write_to_file(file)
```


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/ruby_extensions. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the RubyExtensions project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/ruby_extensions/blob/master/CODE_OF_CONDUCT.md).
