require 'nanoc3/tasks'

desc "Compile site"
task :compile do
  system "nanoc3 compile"
end

desc "Clean public directory"
task :clean do
  puts "deleting:"
  system "rm -rfv public/*"
end

desc "Build site: clean /public then compile"
task :build => [:clean, :compile]

desc "Create new post"
task :post do
  require 'erb'
  title = ENV['title']
  markup = "markdown"
  if title.nil?
    puts 'rake post title="Some title"'
    exit
  end
  template = File.read('templates/post.erb')
  slug = title.downcase.gsub(/[\s\.]+/, '-').gsub(/[^a-z0-9\-]/, '').gsub(/\-{2,}/, '-')
  filename = "content/articles/#{Time.now.strftime('%Y-%m-%d-')}#{slug}.#{markup}"
  if !File.exist?(filename)
    File.open(filename, "w") { |f| f.write ERB.new(template).result(binding) }
    puts "running: #{ENV['EDITOR']} #{filename}"
    system "$EDITOR #{filename}"
  else
    raise RuntimeError.new("File #{filename} already exists!")
  end
end

desc "Watch the site and regenerate when it changes"
task :watch do
  Rake::Task[:clean].execute
  Rake::Task[:compile].execute
  require 'fssm'
  puts ">>> Watching for Changes <<<"
  FSSM.monitor do
    path "#{File.dirname(__FILE__)}/layouts" do
      update {|base, relative| rebuild_site(relative)}
      delete {|base, relative| rebuild_site(relative)}
      create {|base, relative| rebuild_site(relative)}
    end

    path "#{File.dirname(__FILE__)}/content" do
      update {|base, relative| rebuild_site(relative)}
      delete {|base, relative| rebuild_site(relative)}
      create {|base, relative| rebuild_site(relative)}
    end
  end
end

desc "Deploy to github pages"
task :deploy do
  Rake::Task[:clean].execute
  Rake::Task[:compile].execute
  system "cp -Rv ./public/ ../www.stevenringo.com/"
end

def rebuild_site(relative)
  puts ">>> Change Detected to: #{relative} <<<"
  Rake::Task[:clean].execute
  Rake::Task[:compile].execute
end