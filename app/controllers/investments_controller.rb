class InvestmentsController < ApplicationController
  def index
    @investments = Investment.page(params[:page]).per(10)

    render("investments/index.html.erb")
  end

  def show
    @investment = Investment.find(params[:id])

    render("investments/show.html.erb")
  end

  def new
    @investment = Investment.new

    render("investments/new.html.erb")
  end

  def create
    @investment = Investment.new

    @investment.name = params[:name]
    @investment.entity = params[:entity]
    @investment.sponsor = params[:sponsor]
    @investment.asset_type = params[:asset_type]
    @investment.geography = params[:geography]
    @investment.industry = params[:industry]
    @investment.real_estate = params[:real_estate]
    @investment.current_value = params[:current_value]

    save_status = @investment.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/investments/new", "/create_investment"
        redirect_to("/investments")
      else
        redirect_back(:fallback_location => "/", :notice => "Investment created successfully.")
      end
    else
      render("investments/new.html.erb")
    end
  end

  def edit
    @investment = Investment.find(params[:id])

    render("investments/edit.html.erb")
  end

  def update
    @investment = Investment.find(params[:id])

    @investment.name = params[:name]
    @investment.entity = params[:entity]
    @investment.sponsor = params[:sponsor]
    @investment.asset_type = params[:asset_type]
    @investment.geography = params[:geography]
    @investment.industry = params[:industry]
    @investment.real_estate = params[:real_estate]
    @investment.current_value = params[:current_value]

    save_status = @investment.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/investments/#{@investment.id}/edit", "/update_investment"
        redirect_to("/investments/#{@investment.id}", :notice => "Investment updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Investment updated successfully.")
      end
    else
      render("investments/edit.html.erb")
    end
  end

  def destroy
    @investment = Investment.find(params[:id])

    @investment.destroy

    if URI(request.referer).path == "/investments/#{@investment.id}"
      redirect_to("/", :notice => "Investment deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Investment deleted.")
    end
  end
end
