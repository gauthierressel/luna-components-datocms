# Prototype Middleman

## Installation

### Pré-requis

* Ruby 2.3.0 & Bundler 1.10

### Installation depuis le dépôt

    git clone git@codebasehq.com:lunaweb/starter-kits/middleman.git nouveau-projet --depth 1
    cd nouveau-projet
    rm -rf .git && git init
    
    # Dépendances de l'application
    bundle install --path=vendor/bundle --clean
    npm install
    
    bundle exec foreman start