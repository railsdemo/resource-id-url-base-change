class Location < ActiveRecord::Base

  def to_param
    encoded_id
  end

  def self.find(enc_id)
    find_by_id(AnyBase.decode(enc_id, ::BASE28 ))
  end

  def encoded_id
    AnyBase.encode(self[:id], ::BASE28 )
  end

end
