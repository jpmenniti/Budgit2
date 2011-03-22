class DebitCategoriesController < ApplicationController
	before_filter :login_required 
	layout "application"
  # GET /debit_categories
  # GET /debit_categories.xml
  def index
	if current_user.is_admin?
		@debit_categories = DebitCategory.all.paginate :page => params[:page], :per_page => 5

		respond_to do |format|
		  format.html # index.html.erb
		  format.xml  { render :xml => @debit_categories }
		end
	else
		redirect_to root_url
	end
  end

  # GET /debit_categories/1
  # GET /debit_categories/1.xml
  def show
	if current_user.is_admin?
		@debit_category = DebitCategory.find(params[:id])

		respond_to do |format|
		  format.html # show.html.erb
		  format.xml  { render :xml => @debit_category }
		end
	else
		redirect_to root_url
	end
  end

  # GET /debit_categories/new
  # GET /debit_categories/new.xml
  def new
	if current_user.is_admin?
		@debit_category = DebitCategory.new
		@debit_category.active = true

		respond_to do |format|
		  format.html # new.html.erb
		  format.xml  { render :xml => @debit_category }
		end
	else
		redirect_to root_url
	end
  end

  # GET /debit_categories/1/edit
  def edit
    @debit_category = DebitCategory.find(params[:id])
  end

  # POST /debit_categories
  # POST /debit_categories.xml
  def create
    @debit_category = DebitCategory.new(params[:debit_category])

    respond_to do |format|
      if @debit_category.save
        format.html { redirect_to root_url, :notice => 'Debit category was successfully created.'}
		format.xml  { render :xml => @debit_category, :status => :created, :location => @debit_category }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @debit_category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /debit_categories/1
  # PUT /debit_categories/1.xml
  def update
    @debit_category = DebitCategory.find(params[:id])

    respond_to do |format|
      if @debit_category.update_attributes(params[:debit_category])
        format.html { redirect_to(@debit_category, :notice => 'Debit category was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @debit_category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /debit_categories/1
  # DELETE /debit_categories/1.xml
  def destroy
    @debit_category = DebitCategory.find(params[:id])
    @debit_category.destroy

    respond_to do |format|
      format.html { redirect_to(debit_categories_url) }
      format.xml  { head :ok }
    end
  end
  
   def deactivate4
  	@debit_category = DebitCategory.find(params[:id])
	@debit_category.active = false
	@debit_category.save!(:validate => false)
	
	redirect_to(debit_categories_path, :notice => 'Debit Category Deactivated.')
  end
  
  def reactivate4
  	@debit_category = DebitCategory.find(params[:id])
	@debit_category.active = true
	@debit_category.save!(:validate => false)
	
	redirect_to(debit_categories_path, :notice => 'Debit Category Reactivated.')
  end
  
  
end
