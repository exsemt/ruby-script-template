# Ruby script template

* Bundler in a single-file Ruby script
* CSV read/write
* File
* Plain net/http

## How to run

```sh
ruby script.rb
# or
./script.rb
```

## More info

### simple ruby debugger 
* https://docs.ruby-lang.org/en/3.0/DEBUGGER__.html
* https://github.com/ruby/debug

```ruby
# To add a debugger to your code, start by requiring debug in your program:
def say(word)
  require 'debug'
  puts 'foo'
  binding.break # stop
  puts word
end
```

### ruby version manager (asdf)

* https://github.com/asdf-vm/asdf-ruby

## Examples

* curl-to-ruby: https://jhawthorn.github.io/curl-to-ruby/
