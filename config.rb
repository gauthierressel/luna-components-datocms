###
# Page options, layouts, aliases and proxies
###

# DATOCMS
activate :dato, live_reload: true

# enable livereload on development
# configure :development do
#   activate :livereload
# end

# Layout
page "/", :layout => "front"

# No layout
page '*.xml', layout: false
page '*.json', layout: false
page '*.txt', layout: false

# Ignore .md file in assets
ignore "assets/**/*.md"

###
# Dirs
###

# Source & build dir
set :source, "app"

# Assets dir
set :css_dir, "assets/stylesheets"
set :js_dir, "assets/javascripts"
set :images_dir, "assets/images"
set :fonts_dir, "assets/fonts"
set :data_dir, "data"

###
# Extensions
###

# Autoprefixer
activate :autoprefixer do |config|
  config.browsers = ['last 4 versions', 'Explorer >= 10']
end

# Deploy
activate :deploy do |config|
  branch_name = `git rev-parse --abbrev-ref HEAD`
  config.build_before  = false
  config.deploy_method = :rsync
  config.host          = 'lunaweb@preprod-03.lunaweb.io'
  config.path          = "/home/prototype/luna-components/#{branch_name}"
  config.clean         = true
end

# Sprockets
activate :sprockets
sprockets.append_path File.join(root, "node_modules")
sprockets.append_path File.join(root, "app/luna-components/stylesheets")
sprockets.append_path File.join(root, "app/luna-components/javascripts")

###
# Engines
###

# Slim
set :slim, { :pretty => false }

###
# Environnement-specific confirgurations
###

# Development-specific configuration
# configure :development do
#   activate :livereload
# end

# Build-specific configuration
configure :build do
  activate :relative_assets
  set :relative_links, true
  set :slim, { :pretty => true }
end
