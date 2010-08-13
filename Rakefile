begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "pdfservice"
    gem.summary = %Q{lightwight HTML-to-PDF server running on Heroku.com}
    gem.description = %Q{Run your own html-to-pdf server for free on Heroku.com}
    gem.email = "gitcommit@6brand.com"
    gem.homepage = "http://github.com/JackDanger/pdfservice"
    gem.authors = ["Jack Danger Canty"]
    gem.add_dependency "sinatra", ">= 1.0.0"
    gem.add_development_dependency "shoulda", ">= 0"
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end



task :default => :test

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << '.'
  test.pattern = 'test.rb'
  test.verbose = true
end
