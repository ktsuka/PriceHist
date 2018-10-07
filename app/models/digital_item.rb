class DigitalItem < ApplicationRecord

  def self.check(date, maker, price)

      if maker == "ALL" then
        rel = where("itemid LIKE ? and price < ?", "#{date}%", "#{price}")
      else
        rel = where("itemid LIKE ? and maker = ? and price < ?", "#{date}%", "#{maker}", "#{price}")
      end

  end

end
