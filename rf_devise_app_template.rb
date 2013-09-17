remove_file "README.rdoc"
create_file "README.md", "TODO"

gem "haml", "~> 4.0.3"
gem "zurb-foundation", "~> 4.3.1"
gem "devise"
gem "pg"
gem "cancan"
gem 'unicorn', group: :production
gem 'better_errors', group: :development
gem 'haml-rails', group: :development

gem "factory_girl_rails", group: [:development, :test]
gem "rspec-rails", group: [:development, :test]
gem "test_after_commit", group: [:development, :test]
gem "email_spec", group: [:development, :test]




run "bundle install"
generate "rspec:install"
generate "devise:install"
generate "devise User"
generate "foundation:install"
generate "devise:views users"
run "rake db:migrate"


if yes? "Generate a root controller?"
  name = ask("What should it be called?").underscore
  generate :controller, "#{name} index"
  route "root to: '#{name}\#index'"
  remove_file "public/index.html"
end

git :init
append_file ".gitignore", "config/database.yml"
run "cp config/database.yml config/example_database.yml"
git add: ".", commit: "-m 'initial commit'"
