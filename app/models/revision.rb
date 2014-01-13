class Revision < ActiveRecord::Base
  def self.from_hash(hash)
    self.where("hash_code like ?", "#{hash}%").order(:updated_at).first
  end
end
