##Resource IDs - Changing the base in the URL

[Heroku Demo Link](http://resource-id-url-base-change.herokuapp.com/)

A demo of URLs that use a different base.  The base28 follows these guidelines:

1. Use lowercase alpha characters only
2. Exclude vowels - to prevent incidental creation of human readable words that you may want to avoid
3. Exclude similar Characters (zero, O, one, L, I)

To demo this, a location object is used with attributes ID and Name.

It would be easy to extend this using any base.

A mix of resources listed here:

- [Aaron Swartz - A Programmable Web, Ch. 2 Building for Users: Designing URLs](http://www.morganclaypool.com/doi/abs/10.2200/S00481ED1V01Y201302WBE005)
- [AnyBase Encoding](http://stackoverflow.com/a/6338939) (thanks to [Phrogz](http://stackoverflow.com/users/405017/phrogz)) - a few small updates are included below

Base is defined in intializer constant_variabels.rb.  This is slightly different than the base defined by phrogz:

```ruby
::BASE28 = ([*0..9,*'a'..'z'] - %w[a e i l o u] - [0,1]).join
```

Updated AnyBase encoder any_base.rb:

```ruby
#http://stackoverflow.com/a/6338939
#modified to check for ring[char] in decode method
module AnyBase
  
  ENCODER = Hash.new do |h,k|
    h[k] = Hash[ k.chars.map.with_index.to_a.map(&:reverse) ]
  end

  DECODER = Hash.new do |h,k|
    h[k] = Hash[ k.chars.map.with_index.to_a ]
  end
  
  def self.encode( value, keys )
    ring = ENCODER[keys]
    base = keys.length
    result = []
    until value == 0
      result << ring[ value % base ]
      value /= base
    end
    result.reverse.join
  end
  
  def self.decode( string, keys )
    ring = DECODER[keys]
    base = keys.length
    string.reverse.chars.with_index.inject(0) do |sum,(char,i)|
      if ring[char] != nil
        sum + ring[char] * base**i
      end
    end
  end

end
```
