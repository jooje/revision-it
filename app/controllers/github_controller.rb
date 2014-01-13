class GithubController < ApplicationController
  def index
  end

  def import_all
    render text: params[:url]
  end

  def hook
  end
end
