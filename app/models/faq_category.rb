class FaqCategory < ActiveRecord::Base
  
  seo_urls
  
  has_many :faqs, :dependent => :destroy

  default_scope :order => 'name ASC' 
  named_scope :active, :conditions => {:enabled => true}
  
  validates_presence_of :name
    
end