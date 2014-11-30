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
      flash[:notice] = t('cache_created')
      redirect_to geocache_index_path
    else
      flash[:alert] = t('problem_creating')
      render 'new'
    end
  end

  def edit
    @geocache = current_user.geocaches.find_by(id: params[:id])        
  end

  def update
    @geocache = current_user.geocaches.find_by(id: params[:id])        
    if @geocache.update(cache_params)
      flash[:notice] = t('succesfully_updated')
      redirect_to geocache_index_path
    else
      flash[:alert] = t('problem_updating')
      render 'edit'
    end
  end

  def destroy
    @geocache = current_user.geocaches.find_by(id: params[:id])        
    if @geocache.destroy!
      flash[:notice] = t('succesfully_deleted')
      redirect_to geocache_index_path
    else
      flash[:alert] = t('problem_deleting')
      redirect_to root_path
    end
  end

  private

  def cache_params
    params.require(:geocache).permit(:id, :name, :code, :description, :notes, :user_id)
  end
end
