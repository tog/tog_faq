plugin 'tog_faq', :git => "git://github.com/tog/tog_faq.git"

route "map.routes_from_plugin 'tog_faq'"

generate "update_tog_migration"

rake "db:migrate"
