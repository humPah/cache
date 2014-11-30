class GeocachesController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @geocaches = current_user.geocaches
  end

  def show
    @geocache = current_user.geocaches.find_by(id: params[:id])
  end

  def new
    @geocache = current_user.geocaches.new
  end

  def create
    @geocache = current_user.geocaches.new(cache_params)        
    if @geocache.save
      flash[:notice] = "Kätkö luotu"
      redirect_to geocache_index_path
    else
      flash[:alert] = "Ei toiminu :("
      render 'new'
    end
  end

  def edit
    @geocache = current_user.geocaches.find_by(id: params[:id])        
  end

  def update
    @geocache = current_user.geocaches.find_by(id: params[:id])        
    if @geocache.update(cache_params)
      flash[:notice] = "Succesfully updated"
      redirect_to geocache_index_path
    else
      flash[:alert] = "Problems"
      render 'edit'
    end
  end

  def destroy
    @geocache = current_user.geocaches.find_by(id: params[:id])        
    if @geocache.destroy!

    else
      flash[:alert] = "Problem deleting"
      redirect_to root_path
    end
  end

  private

  def cache_params
    params.require(:geocache).permit(:id, :name, :code, :description, :notes, :user_id)
  end
end
