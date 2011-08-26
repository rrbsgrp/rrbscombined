class PurchaseitemsController < ApplicationController
  # GET /purchaseitems
  # GET /purchaseitems.xml
  def index
    @purchaseitems = Purchaseitem.search(params[:from],params[:to])
	
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @purchaseitems }
    end
  end

  # GET /purchaseitems/1
  # GET /purchaseitems/1.xml
  def show
    @purchaseitem = Purchaseitem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @purchaseitem }
    end
  end

  # GET /purchaseitems/new
  # GET /purchaseitems/new.xml
  def new
    @purchaseitem = Purchaseitem.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @purchaseitem }
    end
  end

  # GET /purchaseitems/1/edit
  def edit
    @purchaseitem = Purchaseitem.find(params[:id])
  end

  # POST /purchaseitems
  # POST /purchaseitems.xml
  def create
    @purchaseitem = Purchaseitem.new(params[:purchaseitem])

    respond_to do |format|
      if @purchaseitem.save
        format.html { redirect_to(@purchaseitem, :notice => 'Purchaseitem was successfully created.') }
        format.xml  { render :xml => @purchaseitem, :status => :created, :location => @purchaseitem }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @purchaseitem.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /purchaseitems/1
  # PUT /purchaseitems/1.xml
  def update
    @purchaseitem = Purchaseitem.find(params[:id])

    respond_to do |format|
      if @purchaseitem.update_attributes(params[:purchaseitem])
        format.html { redirect_to(@purchaseitem, :notice => 'Purchaseitem was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @purchaseitem.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /purchaseitems/1
  # DELETE /purchaseitems/1.xml
  def destroy
    @purchaseitem = Purchaseitem.find(params[:id])
    @purchaseitem.destroy

    respond_to do |format|
      format.html { redirect_to(purchaseitems_url) }
      format.xml  { head :ok }
    end
  end
end
