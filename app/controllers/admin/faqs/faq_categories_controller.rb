class Admin::Faqs::FaqCategoriesController < Admin::BaseController
  
  def index
    @faq_categories = FaqCategory.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def new       
    @faq_category = FaqCategory.new
    
    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def create
    @faq_category = FaqCategory.new(params[:faq_category])

    respond_to do |format|
      if @faq_category.save
        flash[:ok] = I18n.t("tog_faq.admin.controllers.category_created")
        format.html { redirect_to edit_admin_faqs_faq_category_path(@faq_category)}
      else
        format.html { render :action => "new" }
      end
    end
  end

  def edit
    @faq_category = FaqCategory.find(params[:id])
    
    respond_to do |format|
      format.html # edit.html.erb
    end
  end

  def update
    @faq_category = FaqCategory.find(params[:id])

    respond_to do |format|
      if @faq_category.update_attributes(params[:faq_category])
        flash[:ok] = I18n.t("tog_faq.admin.controllers.category_updated")
        format.html { redirect_to edit_admin_faqs_faq_category_path(@faq_category) }
      else
        format.html { render :action => "edit" }
      end
    end
  end
  
  def destroy
    @faq_category = FaqCategory.find(params[:id])

    respond_to do |format|
      if @faq_category.destroy
        flash[:notice] = I18n.t("tog_faq.admin.controllers.category_deleted")
        format.html { redirect_to admin_faqs_faq_categories_path }
      else
        flash[:error] = I18n.t("tog_faq.admin.controllers.category_deletion_error")
        format.html { redirect_to edit_admin_faqs_faq_category_path(@faq_category) }
      end
    end
  end  
end