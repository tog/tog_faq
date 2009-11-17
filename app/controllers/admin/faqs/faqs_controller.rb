class Admin::Faqs::FaqsController < Admin::BaseController

  
  def destroy
    @faq = Faq.find(params[:id])
    category = @faq.faq_category
    @faq.destroy
    flash[:ok] = I18n.t("tog_faq.admin.controllers.faq_deteled")
    redirect_to edit_admin_faqs_faq_category_path(category)
  end

  def new
    @faq = Faq.new(:faq_category_id => params[:category])
  end
  
  def create
    @faq = Faq.new(params[:faq])

    respond_to do |format|
      if @faq.save
        flash[:ok] = I18n.t("tog_faq.admin.controllers.faq_created")
        format.html { redirect_to edit_admin_faqs_faq_category_path(@faq.faq_category)}
      else
        format.html { render :action => "new" }
      end
    end
  end

  def edit
    @faq = Faq.find(params[:id])
    
    respond_to do |format|
      format.html # edit.html.erb
    end
  end

  def update
    @faq = Faq.find(params[:id])

    respond_to do |format|
      if @faq.update_attributes(params[:faq])
        flash[:ok] = I18n.t("tog_faq.admin.controllers.faq_updated")
        format.html { redirect_to edit_admin_faqs_faq_category_path(@faq.faq_category) }
      else
        format.html { render :action => "edit" }
      end
    end
  end



end
