class CreateFaq < ActiveRecord::Migration

  def self.up
    create_table :faq_categories do |t|
      t.string    :name
      t.text      :description
      t.boolean   :enabled, :default => true  
      t.timestamps
    end
    
    create_table :faqs do |t|
      t.integer   :faq_category_id
      t.string    :title
      t.text      :body  
      t.boolean   :enabled, :default => true  
      t.timestamps
    end
    
    
  end

  def self.down
    drop_table :faqs
    drop_table :faq_categories
  end

end
