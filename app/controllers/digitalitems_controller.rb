class DigitalitemsController < ApplicationController

  def index
  end

  def show
    @item=DigitalItem.find(params[:id])
  end

  def check
    @digitalitems=DigitalItem.paginate(page: params[:page], per_page: 40).check(params[:q]).order(:maker)

  end

end
