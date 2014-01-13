class RevisionsController < ApplicationController
  before_action :set_revision, only: [:show, :edit, :update, :destroy]

  # GET /revisions
  # GET /revisions.json
  def index
    @revisions = Revision.all
  end

  # GET /revisions/1
  # GET /revisions/1.json
  def show
  end

  # GET /revisions/new
  def new
    @revision = Revision.new
  end

  # GET /revisions/1/edit
  def edit
  end

  # POST /revisions
  # POST /revisions.json
  def create
    @revision = Revision.new(revision_params)

    respond_to do |format|
      if @revision.save
        format.html { redirect_to @revision, notice: 'Revision was successfully created.' }
        format.json { render action: 'show', status: :created, location: @revision }
      else
        format.html { render action: 'new' }
        format.json { render json: @revision.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /revisions/1
  # PATCH/PUT /revisions/1.json
  def update
    respond_to do |format|
      if @revision.update(revision_params)
        format.html { redirect_to @revision, notice: 'Revision was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @revision.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /revisions/1
  # DELETE /revisions/1.json
  def destroy
    @revision.destroy
    respond_to do |format|
      format.html { redirect_to revisions_url }
      format.json { head :no_content }
    end
  end

  def via_hash
    if params[:hash].size < 4 then
      error 'ambiguous hash', 400
    else
      @revision = Revision.from_hash(params[:hash])
      if @revision then
        respond_to do |format|
          format.html { render 'embed', layout: false }
          format.json { render json: { status: 'ok', revision: @revision } }
        end
      else
        error 'No such revision', 404
      end
    end
  end

  private
  def error(text, status)
    respond_to do |format|
      format.html { render text: text, status: status }
      format.json { render json: { status: 'error', reason: text }}
    end
  end

    # Use callbacks to share common setup or constraints between actions.
    def set_revision
      @revision = Revision.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def revision_params
      params.require(:revision).permit(:hash_code, :url, :log)
    end
end
