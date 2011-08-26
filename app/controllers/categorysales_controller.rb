class CategorysalesController < ApplicationController

  def index
    #@categorysales = Categorysale.all(:order => "date DESC")
    #@categorysales = Categorysale.order(:date).group(:date)
    @categorysale = Categorysale.all(:order => "date ASC")
    @categorysales = @categorysale.group_by { |cs| cs.date }
   
    respond_to do |format|
      if params[:commit] == :Search
       Categorysale.all(:order => "date ASC")
      else
      format.html # index.html.erb
      format.xml  { render :xml => @categorysales }
      end
    end
  end


  def show
    @categorysale = Categorysale.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @categorysale }
    end
  end


  def new
    @categorysale = Categorysale.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @categorysale }
    end
  end


  def edit
    @categorysale = Categorysale.find(params[:id])
  end


  def create
    @categorysale = Categorysale.new
    respond_to do |format|
        Categorysale.transaction do 
          Categorysale.create(:cs_amount =>params[:food],:category_id => 0,:employee_id=>params[:employee_id], :date => params[:date],:vat =>params[:vat],:void =>params[:void],:servicecharge =>params[:servicecharge],:cs_revenue =>params[:cs_revenue],:transaction_count =>params[:transaction_count],:customer_count =>params[:customer_count]) 
          Categorysale.create(:cs_amount =>params[:liquor],:category_id => 1,:employee_id=>params[:employee_id], :date => params[:date],:vat =>params[:vat],:void =>params[:void],:servicecharge =>params[:servicecharge],:cs_revenue =>params[:cs_revenue],:transaction_count =>params[:transaction_count],:customer_count =>params[:customer_count]) 
          Categorysale.create(:cs_amount =>params[:beverages],:category_id => 2,:employee_id=>params[:employee_id], :date => params[:date],:vat =>params[:vat],:void =>params[:void],:servicecharge =>params[:servicecharge],:cs_revenue =>params[:cs_revenue],:transaction_count =>params[:transaction_count],:customer_count =>params[:customer_count]) 
        end 
        #format.html { redirect_to(@categorysale, :notice => 'Categorysale was successfully created.') }
        #format.xml  { render :xml => @categorysale, :status => :created, :location => @categorysale }
      #else
        format.html { render :action => "new" }
        #format.xml  { render :xml => @categorysale.errors, :status => :unprocessable_entity }
      #end
    end
  end

  def update
    @categorysale = Categorysale.find(params[:id])

    respond_to do |format|
      if @categorysale.update_attributes(params[:categorysale])
        format.html { redirect_to(@categorysale, :notice => 'Categorysale was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @categorysale.errors, :status => :unprocessable_entity }
      end
    end
  end


  def destroy
    @categorysale = Categorysale.find(params[:id])
    @categorysale.destroy

    respond_to do |format|
      format.html { redirect_to(categorysales_url) }
      format.xml  { head :ok }
    end
  end
  
  def search
    @searchdate = params[:start]['(1i)']+ '-' + params[:start]['(2i)'] + '-' + params[:start]['(3i)']
    @enddate = params[:end]['(1i)']+ '-' + params[:end]['(2i)'] + '-' + params[:end]['(3i)']

    @categorysales = Categorysale.where("date >= ? AND date <= ?",@searchdate,@enddate).group_by { |cs| cs.date }

    respond_to do |format|
      format.html # search.html.erb
      format.xml
    end
  end

end
