class DigitalItem < ApplicationRecord

  def self.check(date, maker, price, type, keyword)
    sql_opt = ""

    if price.to_i == 100000 then
      start_price = 0
    elsif price.to_i > 500000 then
      start_price = 500000
      price = 100000000
    elsif price == "ALL"
      start_price = 0
      price = 100000000
    else
      start_price = price.to_i - 200000
    end

    if type == "all" then
      rel = where("itemid LIKE ? and maker = ? and price between ? and ?","#{date}%", "#{maker}", "#{start_price}", "#{price}")
    else
      rel = where("itemid LIKE ? and maker = ? and price between ? and ? and itype = ?","#{date}%", "#{maker}", "#{start_price}", "#{price}", "#{type}")
    end

  end

end
