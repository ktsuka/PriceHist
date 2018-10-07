class DigitalitemsController < ApplicationController

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
    @digitalitems=DigitalItem.paginate(page: params[:page], per_page: 40).check(params[:q], params[:m], params[:p]).order(:maker)

  end

end
