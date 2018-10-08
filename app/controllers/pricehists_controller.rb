class PricehistsController < ApplicationController

  def index
    @makers=DigitalItem.select(:maker).distinct.order(:maker)
  end

  def show
    @item=DigitalItem.find(params[:id])
  end

  def check
    @checkdate=params[:q].to_date.strftime('%Y/%m/%d')
    @checkmaker=params[:m]
    @rangeprice=params[:p]
    @pricehists=DigitalItem.paginate(page: params[:page], per_page: 40).check(params[:q], params[:m], params[:p], params[:ty], params[:key])

  end

end
