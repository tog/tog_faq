class Faqs::FaqsController < ApplicationController
  
  def index
    @faqs_categories = FaqCategory.active

    respond_to do |format|
      format.html
    end                                  
  end
  
end
