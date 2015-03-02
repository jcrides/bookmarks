class FoldersController < ApplicationController

  def index
    @folders = Folder.all
  end

  def show
    @folder = Folder.find(params[:id])
  end

  def new
    @folder = Folder.new
  end

  def edit
    @folder = Folder.find(params[:id])
  end

  def create
    @folder = Folder.new(folder_params)
    if @folder.save
      redirect_to @folder
    else
      render 'new'
    end
  end

  def update
    @folder = Folder.find(params[:id])
    if @folder.update(folder_params)
      redirect_to @folder
    else
      render 'edit'
    end
  end

  def destroy
    @folder = Folder.find(params[:id])
    @folder.destroy

    redirect_to folders_path
  end


  private
  def folder_params
    params.require(:folder).permit(:name, :description)
  end

end
