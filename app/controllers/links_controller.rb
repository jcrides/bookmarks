class LinksController < ApplicationController

  def index
    @links = Link.where('folder_id is NULL').sort_by { |link| link.name }
  end

  def show
    @link = Link.find(params[:id])
  end

  def new
    @link = Link.new
    @folders = Folder.all.sort_by { |folder| folder.name }
  end

  def edit
    @link = Link.find(params[:id])
    @folders = Folder.all.sort_by { |folder| folder.name }
  end

  def create
    params[:link][:site], params[:link][:path] = Link.split_url(params[:link][:url])
    if params[:folder_id]
      @folder = Folder.find(params[:folder_id])
      @link = @folder.links.create(link_params)
      redirect_to folder_path(@folder)
    else
      @link = Link.new(link_params)
      if @link.save
        redirect_to @link
      else
        render 'new'
      end
    end
  end

  def update
    @link = Link.find(params[:id])
    params[:link][:site], params[:link][:path] = Link.split_url(params[:link][:url])
    if @link.update(link_params)
      redirect_to @link
    else
      render 'edit'
    end
  end

  def destroy
    @link = Link.find(params[:id])
    @link.destroy

    redirect_to links_path
  end


  private
  def link_params
    params.require(:link).permit(:name, :site, :path, :url, :description, :folder_id)
  end

end
