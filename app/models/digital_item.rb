class DigitalItem < ApplicationRecord

  def self.check(date, maker, startprice, endprice, type, keyword)

    if type == "all" and keyword == "" then
      rel = where("itemid LIKE ? and maker = ? and price between ? and ?","#{date}%", "#{maker}", "#{startprice}", "#{endprice}")
    else
      rel = where("itemid LIKE ? and maker = ? and price between ? and ? and itype = ?","#{date}%", "#{maker}", "#{startprice}", "#{endprice}", "#{type}")
    end

  end

end
