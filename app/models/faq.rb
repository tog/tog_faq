class Faq < ActiveRecord::Base
  
  acts_as_commentable
  acts_as_taggable
  seo_urls
  
  belongs_to :faq_category

  default_scope :order => 'title ASC' 
  named_scope   :active, :conditions => {:enabled => true}
  
  validates_presence_of :title, :body, :faq_category_id

  def self.site_search(query, search_options={})
    Faq.active.find(:all, :conditions => ["body like ? or title like ?", "%#{query}%", "%#{query}%"])
  end
  
end
