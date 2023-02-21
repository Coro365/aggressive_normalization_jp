# aggressive_normalization_jp
Converts uncommon characters to common characters or replaces them with empty characters.  
I made it to study ruby gems.  

## Installation
  
```
gem install aggressive_normalization_jp
```
  
## Usage
  
```
require 'aggressive_normalization_jp'

puts "【重要】資料１ -❻- （令和最新版）".normalization
# => "[重要]資料1 -6- (令和最新版)"

puts "【重要】資料１ -❻- （令和最新版）".feature
# => "重要資料16令和最新版"
```
  
## Test
  
```
ruby test/aggressive_normalization_jp_test.rb
```
  
## Credit
Copyright (C) 2023 Coro365  
Licensed under the [MIT](LICENSE) license.  
