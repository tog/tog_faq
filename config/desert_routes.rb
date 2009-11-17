faqs  '/faq',   :controller => 'faqs/faqs',    :action => 'index'

namespace(:admin) do |admin| 
  admin.namespace(:faqs) do |faqs| 
    faqs.resources :faqs
    faqs.resources :faq_categories
  end
end