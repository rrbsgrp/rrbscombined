class SettlementSalesController < ApplicationController

  def index
    @settlement_sale = SettlementSale.all
    @settlement_types = SettlementType.all
    @settlement_sales = @settlement_sale.group_by { |ss| ss.ss_date }
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @settlement_sales }
    end
  end

  def show
    @settlement_sale = SettlementSale.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @settlement_sale }
    end
  end

  def new
    @settlement_sale = SettlementSale.new
    @settlement_type = SettlementType.all
    count = SettlementType.all.count
    
    count.times { @settlement_sale.ssrows.build }
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @settlement_sale }
    end
  end

  def edit
    @settlement_sale = SettlementSale.find(params[:id])
  end

  def create
    @settlement_sale = SettlementSale.new(params[:settlement_sale])

    respond_to do |format|
      if (params[:commit]=="Save")
        SettlementSale.transaction do 
          SettlementSale.create(:ss_amount =>params[:comp91],:st_id => 1, :employee_id =>params[:settlement_sale][:employee_id], :ss_date => params[:ss_date],:void =>params[:void],:ss_revenue =>params[:ss_revenue],:transactionCount =>params[:transactionCount],:customerCount =>params[:customerCount],:gross_total=>params[:gross_total],:net_total=>params[:net_total]) 
          SettlementSale.create(:ss_amount =>params[:comp92],:st_id => 2, :employee_id =>params[:settlement_sale][:employee_id], :ss_date => params[:ss_date],:void =>params[:void],:ss_revenue =>params[:ss_revenue],:transactionCount =>params[:transactionCount],:customerCount =>params[:customerCount],:gross_total=>params[:gross_total],:net_total=>params[:net_total]) 
          SettlementSale.create(:ss_amount =>params[:comp93],:st_id => 3, :employee_id =>params[:settlement_sale][:employee_id], :ss_date => params[:ss_date],:void =>params[:void],:ss_revenue =>params[:ss_revenue],:transactionCount =>params[:transactionCount],:customerCount =>params[:customerCount],:gross_total=>params[:gross_total],:net_total=>params[:net_total])
          SettlementSale.create(:ss_amount =>params[:comp94],:st_id => 4, :employee_id =>params[:settlement_sale][:employee_id], :ss_date => params[:ss_date],:void =>params[:void],:ss_revenue =>params[:ss_revenue],:transactionCount =>params[:transactionCount],:customerCount =>params[:customerCount],:gross_total=>params[:gross_total],:net_total=>params[:net_total]) 
          SettlementSale.create(:ss_amount =>params[:comp95],:st_id => 5, :employee_id =>params[:settlement_sale][:employee_id], :ss_date => params[:ss_date],:void =>params[:void],:ss_revenue =>params[:ss_revenue],:transactionCount =>params[:transactionCount],:customerCount =>params[:customerCount],:gross_total=>params[:gross_total],:net_total=>params[:net_total]) 
          SettlementSale.create(:ss_amount =>params[:comp96],:st_id => 6, :employee_id =>params[:settlement_sale][:employee_id], :ss_date => params[:ss_date],:void =>params[:void],:ss_revenue =>params[:ss_revenue],:transactionCount =>params[:transactionCount],:customerCount =>params[:customerCount],:gross_total=>params[:gross_total],:net_total=>params[:net_total]) 
          SettlementSale.create(:ss_amount =>params[:comp97],:st_id => 7, :employee_id =>params[:settlement_sale][:employee_id],:ss_date => params[:ss_date],:void =>params[:void],:ss_revenue =>params[:ss_revenue],:transactionCount =>params[:transactionCount],:customerCount =>params[:customerCount],:gross_total=>params[:gross_total],:net_total=>params[:net_total]) 
          SettlementSale.create(:ss_amount =>params[:creditcard],:st_id => 9, :employee_id =>params[:settlement_sale][:employee_id], :ss_date => params[:ss_date],:void =>params[:void],:ss_revenue =>params[:ss_revenue],:transactionCount =>params[:transactionCount],:customerCount =>params[:customerCount],:gross_total=>params[:gross_total],:net_total=>params[:net_total]) 
          SettlementSale.create(:ss_amount =>params[:cash],:st_id => 10, :employee_id =>params[:settlement_sale][:employee_id], :ss_date => params[:ss_date],:void =>params[:void],:ss_revenue =>params[:ss_revenue],:transactionCount =>params[:transactionCount],:customerCount =>params[:customerCount],:gross_total=>params[:gross_total],:net_total=>params[:net_total])  
          SettlementSale.create(:ss_amount =>params[:giftcertificate],:st_id => 11, :employee_id =>params[:settlement_sale][:employee_id], :ss_date => params[:ss_date],:void =>params[:void],:ss_revenue =>params[:ss_revenue],:transactionCount =>params[:transactionCount],:customerCount =>params[:customerCount],:gross_total=>params[:gross_total],:net_total=>params[:net_total]) 
        end
        format.html { redirect_to(@settlement_sale, :notice => 'Settlement sale was successfully created.') }
        format.xml  { render :xml => @settlement_sale, :status => :created, :location => @settlement_sale }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @settlement_sale.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @settlement_sale = SettlementSale.find(params[:id])

    respond_to do |format|
      if @settlement_sale.update_attributes(params[:settlement_sale])
        format.html { redirect_to(@settlement_sale, :notice => 'Settlement sale was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @settlement_sale.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @settlement_sale = SettlementSale.find(params[:id])
    @settlement_sale.destroy

    respond_to do |format|
      format.html { redirect_to(settlement_sales_url) }
      format.xml  { head :ok }
    end
  end

  def search
    @searchdate = params[:start]['(1i)']+ '-' + params[:start]['(2i)'] + '-' + params[:start]['(3i)']
    @enddate = params[:end]['(1i)']+ '-' + params[:end]['(2i)'] + '-' + params[:end]['(3i)']
    @header = "Search results for: " + @searchdate + ' to ' + @enddate
    @settlement_sales = SettlementSale.where("ss_date >= ? and ss_date <= ?",@searchdate,@enddate).group_by { |ss| ss.ss_date }
    render :template => 'shared/settlement_sales'
  end

  def serversales
    @settlement_sale = SettlementSale.all
    @settlement_sales = @settlement_sale.group_by { |ss| ss.ss_date }
    render :template => 'shared/server_sales_by_settlement_type'
    #respond_to do |format|
      #format.html # search.html.erb
      #format.xml
    #end
  end
  
  def serversales_search
    @searchdate = params[:start]['(1i)']+ '-' + params[:start]['(2i)'] + '-' + params[:start]['(3i)']
    @enddate = params[:end]['(1i)']+ '-' + params[:end]['(2i)'] + '-' + params[:end]['(3i)']
    @employee_firstName = params[:firstname]
    @employee_lastName = params[:lastname]
    
    @header = "Search results for: " + @employee_firstName + ' ' + @employee_lastName + ' ,' + @searchdate + ' to ' + @enddate
    
    employee_id = Employee.where("employee_firstName = ? AND employee_lastName = ?",@employee_firstName,@employee_lastName)
    @settlement_sales = SettlementSale.where("(ss_date >= ? AND ss_date <= ?) AND (employee_id = ?)",@searchdate,@enddate,employee_id).group_by { |ss| ss.ss_date }
    render :template => 'shared/server_sales_by_settlement_type'
  end
end
