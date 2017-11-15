class LinksController < ApplicationController
  before_action :prevent_unauthorized_user_access, only: [:new, :edit]

  def index
    @links = Link.all
  end

  def new
    @link  = Link.new
  end

  def create
    @link = current_user.links.new(link_params)

    if @link.save
      redirect_to root_path, notice: 'Link succssfully created'
    else
      render :new
    end
  end

  def show
  end

  def edit
    link = Link.find_by(id: params[:id])

    if current_user.owns_link?(link)
      @link = link
    else
      redirect_to root_path, notice: 'Not authorized to edit this link'
    end
  end

  def update
    @link = current_user.links.find_by(id: params[:id])
    if @link.update(link_params)
      redirect_to root_path, notice: 'Link was successfully updated'
    else
      render :edit
    end
  end

  def destroy
    link = Link.find_by(id: params[:id])
    if current_user.owns_link?(link)
      link.destroy
      redirect_to root_path, notice: 'Link successfully deleted'
    else
      redirec_to root_path, notice: 'You are not authorized to delete this link'
    end
  end


  private

  def link_params
    params.require(:link).permit(:title, :url, :description)
  end
end
