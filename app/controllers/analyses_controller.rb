class AnalysesController < ApplicationController

   before_action :find_analysis, only: [:show, :edit, :update, :destroy]
  def index
   @analyses = Analysis.all.order ('created_at DESC')
  end

  def new
    @analysis = Analysis.new
  end

  def create
    @analysis = Analysis.new analysis_params

    if @analysis.save
      redirect_to @analysis, notice: "Analysis done brah!!"
    else
      render 'new', notice: "Unsuccesfull brah!!"
    end

  end

  def show
  end

  def edit
  end

  def update
    if @analysis.update analysis_params
      redirect_to @analysis, notice: "Article is updated. Bleep Blop"
    else 
      render 'edit'
    end
  end 

  def destroy
    @analysis.destroy
    redirect_to analyses_path
  end


  private
    
    def analysis_params
      params.require(:analysis).permit(:title, :content, :subtitle)
    end 

    def find_analysis
      @analysis = Analysis.find(params[:id])
    end
end
