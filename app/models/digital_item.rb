class DigitalItem < ApplicationRecord

  def self.check(date)
      rel = where("itemid LIKE ?", "#{date}%")
  end

end
