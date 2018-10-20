class PricehistsController < ApplicationController

  def index
    if params[:item_category] == nil then
      @Summary=SummaryItem.group(:itemdate).sum(:count)
      @Title="Total Summary"
    end

    if params[:item_category] == "dg" then
      @Summary=SummaryItem.where(category: params[:item_category]).group(:itemdate).sum(:count)
      @Title="Digital Summary"
    end

    if params[:item_category] == "ef" then
      @Summary=SummaryItem.where(category: params[:item_category]).group(:itemdate).sum(:count)
      @Title="Effector Summary"
    end

    if params[:item_category] == "am" then
      @Summary=SummaryItem.where(category: params[:item_category]).group(:itemdate).sum(:count)
      @Title="Amp Summary"
    end

  end

  def show
    @item=DigitalItem.find(params[:id])
  end

  def find
    @makers=DigitalItem.select(:maker).distinct.order(:maker)
  end

  def check
    @checkdate=params[:q].to_date.strftime('%Y/%m/%d')
    @checkmaker=params[:m]
    startprice, endprice, @rangeprice =calc(params[:p])
    @pricehists=DigitalItem.paginate(page: params[:page], per_page: 40).check(params[:q], params[:m], startprice, endprice, params[:ty], params[:key])

  end

  private
    def calc(price)
      if price.to_i == 100000 then
        startprice = 0
        endprice = 100000
        rangeprice = " 〜 ¥100,000"
      elsif price.to_i > 500000 then
        startprice = 500000
        endprice = 100000000
        rangeprice = "¥500,000  〜 "
      elsif price == "ALL"
        startprice = 0
        endprice = 100000000
        rangeprice = "すべて"
      else
        startprice = price.to_i - 200000
        endprice = price.to_i
        rangeprice = "¥" + startprice.to_s(:delimited) + " 〜 ¥" + endprice.to_s(:delimited)
      end
      return startprice,  endprice, rangeprice
    end

end
