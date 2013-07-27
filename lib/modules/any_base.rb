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
    string.reverse.chars.each_with_index.inject(0) do |sum,(char,i)|
      if ring[char] != nil
        sum + ring[char] * base**i
      end
    end
  end

end