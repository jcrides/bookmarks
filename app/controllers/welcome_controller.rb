class WelcomeController < ApplicationController

  def index
    @folders = Folder.all.sort_by { |folder| folder.name }
    @links = Link.all.sort_by { |link| link.name }
  end
  
end
