class Location < ActiveRecord::Base
  
  def to_param
    AnyBase.encode(self.id, ::BASE28 )
  end

  def self.decode_id(enc_id)
    find(AnyBase.decode(enc_id, ::BASE28 ))
  end

  def encoded_id
    AnyBase.encode(self.id, ::BASE28 )
  end
  
end
