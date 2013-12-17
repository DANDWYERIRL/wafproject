class BlanksController < ApplicationController
  # GET /blanks
  # GET /blanks.json
  def index
    @blanks = Blank.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @blanks }
    end
  end

  # GET /blanks/1
  # GET /blanks/1.json
  def show
    @blank = Blank.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @blank }
    end
  end

  # GET /blanks/new
  # GET /blanks/new.json
  def new
    @blank = Blank.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @blank }
    end
  end

  # GET /blanks/1/edit
  def edit
    @blank = Blank.find(params[:id])
  end

  # POST /blanks
  # POST /blanks.json
  def create
    @blank = Blank.new(params[:blank])

    respond_to do |format|
      if @blank.save
        format.html { redirect_to @blank, notice: 'Blank was successfully created.' }
        format.json { render json: @blank, status: :created, location: @blank }
      else
        format.html { render action: "new" }
        format.json { render json: @blank.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /blanks/1
  # PUT /blanks/1.json
  def update
    @blank = Blank.find(params[:id])

    respond_to do |format|
      if @blank.update_attributes(params[:blank])
        format.html { redirect_to @blank, notice: 'Blank was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @blank.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blanks/1
  # DELETE /blanks/1.json
  def destroy
    @blank = Blank.find(params[:id])
    @blank.destroy

    respond_to do |format|
      format.html { redirect_to blanks_url }
      format.json { head :no_content }
    end
  end
end
