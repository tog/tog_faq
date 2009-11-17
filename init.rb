require_plugin 'tog_core'

require "i18n" unless defined?(I18n)
Dir[File.dirname(__FILE__) + '/locale/**/*.yml'].each do |file|
  I18n.load_path << file
end

Tog::Plugins.helpers Faqs::FaqsHelper

Tog::Interface.sections(:site).add "FAQ", "/faq"     
Tog::Interface.sections(:admin).add "FAQ", "/admin/faqs/faq_categories"

Tog::Search.sources << "Faq"
