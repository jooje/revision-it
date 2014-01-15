require 'uri'
require 'github_api'

class GithubController < ApplicationController
  include ErrorHandle
  def index
  end

  def import_all
    url = URI.parse params[:url]

    if url.host == 'github.com' then
      if url.path =~ %r!\A/([^/]*)/([^/]*)! then
        user = $1
        repos = $2
        Github.repos.commits.all(user, repos).each do|commit|
          Revision.where(hash_code: commit.sha).first_or_create! do |rev|
            rev.url = commit.html_url
            rev.log = commit.commit.message
          end
        end
        respond_to do|format|
          format.html { redirect_to github_path, notice: 'ok' }
          format.json { render json: { status: 'ok' } }
        end
      else
        error 'not valid url', 400
      end
    else
      error 'not github url', 400
    end
  end

  def hook
  end
end
