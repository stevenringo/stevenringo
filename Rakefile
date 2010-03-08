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

def rebuild_site(relative)
  puts ">>> Change Detected to: #{relative} <<<"
  Rake::Task[:clean].execute
  Rake::Task[:compile].execute
end