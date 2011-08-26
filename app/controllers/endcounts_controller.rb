class EndcountsController < ApplicationController
  # GET /endcounts
  # GET /endcounts.xml
  def index
    @endcounts = Endcount.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @endcounts }
    end
  end

  # GET /endcounts/1
  # GET /endcounts/1.xml
  def show
    @endcount = Endcount.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @endcount }
    end
  end

  # GET /endcounts/new
  # GET /endcounts/new.xml
  def new
    @endcount = Endcount.new
	@count = Inventoryitem.count
	@i = 0
	while @i < @count do
		@i = @i+1
		@endcount.ecrows.build
	end
	
	#@count.times { @endcount.ecrows.build }
	
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @endcount }
    end
  end

  # GET /endcounts/1/edit
  def edit
    @endcount = Endcount.find(params[:id])
  end

  # POST /endcounts
  # POST /endcounts.xml
  def create
    @endcount = Endcount.new(params[:endcount])

    respond_to do |format|
      if @endcount.save
        format.html { redirect_to(@endcount, :notice => 'Endcount was successfully created.') }
        format.xml  { render :xml => @endcount, :status => :created, :location => @endcount }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @endcount.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /endcounts/1
  # PUT /endcounts/1.xml
  def update
    @endcount = Endcount.find(params[:id])

    respond_to do |format|
      if @endcount.update_attributes(params[:endcount])
        format.html { redirect_to(@endcount, :notice => 'Endcount was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @endcount.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /endcounts/1
  # DELETE /endcounts/1.xml
  def destroy
    @endcount = Endcount.find(params[:id])
    @endcount.destroy

    respond_to do |format|
      format.html { redirect_to(endcounts_url) }
      format.xml  { head :ok }
    end
  end
end
